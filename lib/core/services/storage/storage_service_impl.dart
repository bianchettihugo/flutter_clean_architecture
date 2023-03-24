import 'package:flutter_clean_architecture/core/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl extends StorageService {
  late SharedPreferences _storage;

  StorageServiceImpl([SharedPreferences? storage]) {
    Future.delayed(const Duration(milliseconds: 1), () async {
      _storage = storage ?? await SharedPreferences.getInstance();
    });
  }

  @override
  Future<bool> delete(String key) async {
    await _storage.remove(key);
    return true;
  }

  @override
  Future<String?> read(String key) async {
    return _storage.getString(key);
  }

  @override
  Future<bool> save(String key, String content) async {
    return await _storage.setString(key, content);
  }
}
