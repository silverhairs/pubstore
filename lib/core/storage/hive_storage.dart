import 'package:hive/hive.dart';
import 'package:pubstore/core/storage/storage.dart';

/// An implementation of [Storage] that uses [Hive] to persist data.
class HiveStorage implements Storage<Box<Map<String, dynamic>>> {
  /// Initializes a new [HiveStorage]
  const HiveStorage(this._box);

  final Box<Map<String, dynamic>> _box;

  @override
  Future<Map<String, dynamic>?> read(covariant String key) async {
    final data = _box.get(key);
    return data;
  }

  @override
  Future<List<Map<String, dynamic>>> readAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> save(covariant String id, Map<String, dynamic> data) async {
    await _box.put(id, data);
  }

  @override
  Box<Map<String, dynamic>> get store => _box;
}
