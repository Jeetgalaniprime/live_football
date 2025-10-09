import 'package:get_storage/get_storage.dart';

class GetStorageService {
  static final _box = GetStorage();

  // Save data
  static Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  // Read data
  static T? read<T>(String key) {
    return _box.read<T>(key);
  }

  // Check if key exists
  static bool has(String key) {
    return _box.hasData(key);
  }

  // Remove key
  static Future<void> remove(String key) async {
    await _box.remove(key);
  }

  // Clear all keys
  static Future<void> clear() async {
    await _box.erase();
  }
}
