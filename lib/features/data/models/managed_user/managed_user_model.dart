import 'package:flutter_riverpod_base/features/domain/entities/managed_user_entity.dart';

/// JSON/Hive-friendly DTO for [ManagedUserEntity].
class ManagedUserModel {
  const ManagedUserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String surname;
  final String email;
  final DateTime updatedAt;

  ManagedUserEntity toEntity() => ManagedUserEntity(
        id: id,
        name: name,
        surname: surname,
        email: email,
        updatedAt: updatedAt,
      );

  factory ManagedUserModel.fromEntity(ManagedUserEntity e) => ManagedUserModel(
        id: e.id,
        name: e.name,
        surname: e.surname,
        email: e.email,
        updatedAt: e.updatedAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'email': email,
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory ManagedUserModel.fromJson(Map<String, dynamic> json) {
    return ManagedUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
