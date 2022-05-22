/// A storage that helps to retrieve and put data in a [store].
abstract class Storage<Store extends Object> {
  /// The store that holds the data in this [Storage].
  Store get store;

  /// Gets data from the [store] with the given [id]
  Future<Map<String, dynamic>?> read(covariant String id);

  /// Saves [data] in [store] using the passed [id].
  ///
  /// If there is something saved on the passed [id], the saved data will be
  /// replaced by the newly passed [data].
  Future<void> save(covariant String id, Map<String, dynamic> data);

  /// Gets all the data contained in the [store].
  Future<List<Map<String, dynamic>>> readAll();
}
