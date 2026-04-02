/// Reads/writes the managed-users list as JSON in Hive (single box key).
abstract class ManagedUsersLocalDatasource {
  Future<List<Map<String, dynamic>>> readAll();

  Future<void> writeAll(List<Map<String, dynamic>> rows);
}
