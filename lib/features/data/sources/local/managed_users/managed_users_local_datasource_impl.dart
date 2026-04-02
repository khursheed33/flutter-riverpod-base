import 'dart:convert';

import 'package:flutter_riverpod_base/core/constants/hive_collections.dart';
import 'package:flutter_riverpod_base/features/data/sources/local/managed_users/managed_users_local_datasource.dart';
import 'package:hive/hive.dart';

class ManagedUsersLocalDatasourceImpl implements ManagedUsersLocalDatasource {
  ManagedUsersLocalDatasourceImpl({required Box<dynamic> hiveBox}) : _box = hiveBox;

  final Box<dynamic> _box;

  @override
  Future<List<Map<String, dynamic>>> readAll() async {
    final raw = _box.get(HiveKeys.managedUsers);
    if (raw == null) return [];
    if (raw is String) {
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    }
    if (raw is List) {
      return raw.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    }
    return [];
  }

  @override
  Future<void> writeAll(List<Map<String, dynamic>> rows) async {
    await _box.put(HiveKeys.managedUsers, jsonEncode(rows));
  }
}
