import 'providers/isar_provider.dart';

class InfraInit with IsarProvider {
  Future<void> ensureInitialized() async {
    if (!isIsarInit) {
      await initIsar();
    }
  }
}
