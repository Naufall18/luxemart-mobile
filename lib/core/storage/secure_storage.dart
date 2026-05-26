import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/logger.dart';

/// Provider for FlutterSecureStorage
final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});

/// Wrapper class for FlutterSecureStorage with error handling
class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  /// Write data to secure storage
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      Logger.debug('Wrote to secure storage: $key', tag: 'SecureStorage');
    } catch (e) {
      Logger.error(
        'Failed to write to secure storage: $key',
        tag: 'SecureStorage',
        error: e,
      );
      rethrow;
    }
  }

  /// Read data from secure storage
  Future<String?> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      Logger.debug('Read from secure storage: $key', tag: 'SecureStorage');
      return value;
    } catch (e) {
      Logger.error(
        'Failed to read from secure storage: $key',
        tag: 'SecureStorage',
        error: e,
      );
      return null;
    }
  }

  /// Delete data from secure storage
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
      Logger.debug('Deleted from secure storage: $key', tag: 'SecureStorage');
    } catch (e) {
      Logger.error(
        'Failed to delete from secure storage: $key',
        tag: 'SecureStorage',
        error: e,
      );
      rethrow;
    }
  }

  /// Delete all data from secure storage
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
      Logger.debug('Deleted all from secure storage', tag: 'SecureStorage');
    } catch (e) {
      Logger.error(
        'Failed to delete all from secure storage',
        tag: 'SecureStorage',
        error: e,
      );
      rethrow;
    }
  }

  /// Check if key exists in secure storage
  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      Logger.error(
        'Failed to check key in secure storage: $key',
        tag: 'SecureStorage',
        error: e,
      );
      return false;
    }
  }
}
