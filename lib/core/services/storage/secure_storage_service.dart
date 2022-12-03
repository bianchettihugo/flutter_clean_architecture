abstract class SecureStorageService {
  Future<bool> save(String key, String content);

  Future<bool> delete(String key);

  Future<String?> read(String key);
}
