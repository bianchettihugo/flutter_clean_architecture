import 'package:flutter_clean_architecture/core/services/storage/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServiceImpl extends SecureStorageService {
  late FlutterSecureStorage _storage;

  SecureStorageServiceImpl([FlutterSecureStorage? storage]) {
    _storage = storage ?? const FlutterSecureStorage();
  }

  @override
  Future<bool> delete(String key) async {
    await _storage.delete(key: key);
    return true;
  }

  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<bool> save(String key, String content) async {
    await _storage.write(key: key, value: content);
    return true;
  }
}
