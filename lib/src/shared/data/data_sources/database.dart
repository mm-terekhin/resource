import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart' as path;
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';

import '../../../../core/core.dart';

part 'database.g.dart';

@DriftDatabase()
class Database extends _$Database {
  Database({
    required DirectoryService directoryService,
    required FlutterSecureStorage secureStorage,
    required Base64Codec base64codec,
    required String encryptionKey,
  }) : super(
          _openDatabase(
            encryptionKey: encryptionKey,
            directoryService: directoryService,
            secureStorage: secureStorage,
            base64codec: base64codec,
          ),
        );

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openDatabase({
  required DirectoryService directoryService,
  required FlutterSecureStorage secureStorage,
  required Base64Codec base64codec,
  required String encryptionKey,
}) {
  return LazyDatabase(() async {
    final directoryPath = await directoryService.getSupportedDirectory();
    final dbFile = File(path.join(directoryPath, 'db.sqlite'));

    var encodedSecureKey = await secureStorage.read(
      key: encryptionKey,
    );

    if (encodedSecureKey == null) {
      final generatedKey = _generateRandomKey(24);
      encodedSecureKey = base64codec.encode(generatedKey);
      await secureStorage.write(
        key: encryptionKey,
        value: encodedSecureKey,
      );
    }

    return NativeDatabase.createInBackground(
      dbFile,
      isolateSetup: () async {
        await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
        open.overrideFor(OperatingSystem.android, openCipherOnAndroid);
      },
      setup: (db) {
        final result = db.select('PRAGMA cipher_version;');
        if (result.isEmpty) {
          throw UnsupportedError(
            'This database needs to run with SQLCipher, but that library is '
            'not available!',
          );
        }

        db.execute("PRAGMA key = '$encryptionKey'");

        db.config.doubleQuotedStringLiterals = false;
      },
    );
  });
}

List<int> _generateRandomKey(int length) {
  final random = Random.secure();
  final key = List<int>.generate(
    length,
    (index) => random.nextInt(256),
  );
  return key;
}
