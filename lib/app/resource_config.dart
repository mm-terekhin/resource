import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Config {
  factory Config() => const ResourceConfig.internal();

  String? get databaseEncryptionKey;
}

class ResourceConfig implements Config {
  const ResourceConfig.internal();

  @override
  String? get databaseEncryptionKey => dotenv.env['DATABASE_KEY'];
}