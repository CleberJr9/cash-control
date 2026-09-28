import 'package:cash_control/core/theme/enums/storage_key_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> save(StorageKeyEnum key, String value) async {
    await _storage.write(key: key.name, value: value);
  }

  Future<String?> read(StorageKeyEnum key) {
    return _storage.read(key: key.name);
  }

  Future<void> delete(StorageKeyEnum key) async {
    await _storage.delete(key: key.name);
  }
}

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});
