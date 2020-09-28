import 'package:equatable/equatable.dart';
import 'package:pandumu/model/user/user_model.dart';

abstract class UserManagementState extends Equatable {
  UserManagementState([List props = const []]);
}

class UserLoading extends UserManagementState {}

class UserEmpty extends UserManagementState {}

class UserLoaded extends UserManagementState {
  final List<UserModel> users;

  UserLoaded([this.users = const []]);

  @override
  List<Object> get props => [users];

  @override
  String toString() => 'UserManagamentLoaded { todos: $users }';
}

class UserNotLoaded extends UserManagementState {}
