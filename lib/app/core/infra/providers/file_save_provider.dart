import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

class FileSaveProvider {
  FileSaveProvider();

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
    }

    return outputDir;
  }

  static Future<File> getFile(String filename) async {
    final path = await directoryPath;
    return File('$path/${DateTime.now().millisecondsSinceEpoch}__$filename');
  }

  static Future<bool> writeToFile(String filename, Uint8List data) async {
    final startTime = DateTime.now();
    final file = await getFile(filename);
    final result = await file.writeAsBytes(
      data,
      flush: true,
      mode: FileMode.writeOnly,
    );

    final fileStatus = await result.stat();
    return fileStatus.size > 0 && fileStatus.modified.isAfter(startTime);
  }
}
