import 'providers/isar_provider.dart';

class InfraInit with IsarProvider {
  Future<void> ensureInitialized() async {
    final futures = <Future>[];
    if (!isIsarInit) {
      futures.add(initIsar());
    }
    await Future.wait(futures);
  }
}
