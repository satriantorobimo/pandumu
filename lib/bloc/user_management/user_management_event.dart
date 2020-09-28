import 'package:equatable/equatable.dart';
import 'package:pandumu/model/user/user_model.dart';

abstract class UserManagementEvent extends Equatable {
  UserManagementEvent([List props = const []]);
}

class LoadUser extends UserManagementEvent {}

class AddUser extends UserManagementEvent {
  final UserModel user;

  AddUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AddUser { user: $user }';
}

class UpdateUser extends UserManagementEvent {
  final UserModel user;

  UpdateUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UpdateUser { user: $user }';
}

class DeleteUser extends UserManagementEvent {
  final UserModel user;

  DeleteUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'DeleteUser { user: $user }';
}

class UserUpdated extends UserManagementEvent {
  final List<UserModel> user;

  UserUpdated(this.user);

  @override
  List<Object> get props => [user];
}
