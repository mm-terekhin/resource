import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class DirectoryService {
  const DirectoryService();

  Future<String> getSupportedDirectory() async {
    final directory = await getApplicationSupportDirectory();

    _prepareSaveDirSync(
      directory: directory,
    );

    return directory.path;
  }

  Future<String> getApplicationDirectory({
    required TargetPlatform platform,
  }) async {
    late Directory directory;

    if (platform == TargetPlatform.android) {
      directory = Directory('/sdcard/download/');
    } else {
      final data = await getApplicationDocumentsDirectory();

      directory = Directory('${data.path}${Platform.pathSeparator}Download');
    }

    _prepareSaveDirSync(
      directory: directory,
    );

    return directory.path;
  }

  void _prepareSaveDirSync({
    required Directory directory,
  }) {
    final hasExisted = directory.existsSync();
    if (!hasExisted) {
      directory.createSync();
    }
  }
}
