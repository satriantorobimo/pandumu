import 'dart:async';

import 'package:pandumu/model/user/user_model.dart';

abstract class UserRepository {
  Future<void> addNewUser(UserModel user);

  Future<void> deleteUser(UserModel user);

  Stream<List<UserModel>> users();

  Stream<List<UserModel>> specUsers(UserModel user);

  Future<void> updateUser(UserModel user);
}
