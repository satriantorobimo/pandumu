import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pandumu/model/user/user_model.dart';
import 'package:pandumu/repository/user_repo/user_repo.dart';
import 'package:pandumu/entity/user_entity/entities.dart';

class FirebaseUserRepository implements UserRepository {
  final userCollection = Firestore.instance.collection('user');

  @override
  Future<void> addNewUser(UserModel user) {
    return userCollection.add(user.toEntity().toDocument());
  }

  @override
  Future<void> deleteUser(UserModel user) async {
    return userCollection.document(user.userid).delete();
  }

  @override
  Stream<List<UserModel>> users() {
    return userCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => UserModel.fromEntity(UserEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Stream<List<UserModel>> specUsers(UserModel user) {
    return userCollection
        .where('userid', isEqualTo: user.userid)
        .snapshots()
        .map((snapshot) {
      return snapshot.documents
          .map((doc) => UserModel.fromEntity(UserEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateUser(UserModel update) {
    return userCollection
        .document(update.userid)
        .updateData(update.toEntity().toDocument());
  }
}
