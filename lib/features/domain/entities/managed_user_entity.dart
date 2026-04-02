import 'package:equatable/equatable.dart';

/// Demo CRUD user stored in local Hive (manage-users feature).
class ManagedUserEntity extends Equatable {
  const ManagedUserEntity({
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

  @override
  List<Object?> get props => [id, name, surname, email, updatedAt];
}
