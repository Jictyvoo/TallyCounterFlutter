import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

abstract class FileSaveProvider {
  static Future<String> get directoryPath async {
    if (Platform.isAndroid || Platform.isIOS || Platform.isWindows) {
      var permissionStatus = await Permission.storage.status;
      if (permissionStatus == PermissionStatus.denied ||
          permissionStatus == PermissionStatus.permanentlyDenied) {
        permissionStatus = await Permission.storage.request();
        if (permissionStatus != PermissionStatus.granted) {
          throw Exception('Permission denied');
        }
      }
    }

    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    String outputDir = appDocDir.path;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final downloadDir = await path_provider.getDownloadsDirectory();
      outputDir = downloadDir?.path ?? '';
    } else if (Platform.isAndroid) {
      final externalDir = await path_provider.getExternalStorageDirectory();
      outputDir = externalDir?.path ?? '';
    }

    return outputDir;
  }

  static Future<File> getFile(
    String filename, [
    String outputFolder = '',
  ]) async {
    final path = outputFolder.isEmpty ? await directoryPath : outputFolder;
    return File('$path/${DateTime.now().millisecondsSinceEpoch}__$filename');
  }

  static Future<String> writeToFile(
    String filename,
    Uint8List data, {
    String outputFolder = '',
  }) async {
    final file = await getFile(filename, outputFolder);
    final result = await file.writeAsBytes(
      data,
      flush: true,
      mode: FileMode.writeOnly,
    );

    final fileStatus = await result.stat();
    if (fileStatus.size >= data.length &&
        fileStatus.modified.compareTo(fileStatus.accessed) >= 0) {
      return file.path;
    }
    return '';
  }
}
