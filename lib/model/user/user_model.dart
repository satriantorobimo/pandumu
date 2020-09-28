import 'package:flutter/material.dart';
import 'package:pandumu/entity/user_entity/entities.dart';

@immutable
class UserModel {
  String username;
  String name;
  String password;
  String email;
  String phone;
  String bio;
  String bod;
  bool bodShow;
  String bpTitle;
  String bpContent;
  String gender;
  String formattedDate;
  String userid;

  UserModel(
      {this.username,
      this.name,
      this.password,
      this.email,
      this.phone,
      this.bio,
      this.bod,
      this.bodShow,
      this.bpTitle,
      this.bpContent,
      this.gender,
      this.formattedDate,
      this.userid});

  UserModel copyWith(
      {String username,
      String name,
      String password,
      String email,
      String phone,
      String bio,
      String bod,
      bool bodShow,
      String bpTitle,
      String bpContent,
      String gender,
      String formattedDate,
      String userid}) {
    return UserModel(
        username: username ?? this.username,
        name: name ?? this.name,
        password: password ?? this.password,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        bio: bio ?? this.bio,
        bod: bod ?? this.bod,
        bodShow: bodShow ?? this.bodShow,
        bpTitle: bpTitle ?? this.bpTitle,
        bpContent: bpContent ?? this.bpContent,
        gender: gender ?? this.gender,
        formattedDate: formattedDate ?? this.formattedDate,
        userid: userid ?? this.userid);
  }

  @override
  int get hashCode =>
      username.hashCode ^
      name.hashCode ^
      password.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      bio.hashCode ^
      bod.hashCode ^
      bodShow.hashCode ^
      bpTitle.hashCode ^
      bpContent.hashCode ^
      gender.hashCode ^
      formattedDate.hashCode ^
      userid.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          name == other.name &&
          password == other.password &&
          email == other.email &&
          phone == other.phone &&
          bio == other.bio &&
          bod == other.bod &&
          bodShow == other.bodShow &&
          bpTitle == other.bpTitle &&
          bpContent == other.bpContent &&
          gender == other.gender &&
          formattedDate == other.formattedDate &&
          userid == other.userid;

  @override
  String toString() {
    return 'UserModer { username : $username, name : $name, password : $password, email : $email, phone : $phone,bio : $bio,bod : $bod,bodShow : $bodShow,bpTitle : $bpTitle,bpContent : $bpContent,gender : $gender,formattedDate : $formattedDate, userid : $userid}';
  }

  UserEntity toEntity() {
    return UserEntity(username, name, password, email, phone, bio, bod, bodShow,
        bpTitle, bpContent, gender, formattedDate, userid);
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
        username: entity.username,
        name: entity.name,
        password: entity.password,
        email: entity.email,
        phone: entity.phone,
        bio: entity.bio,
        bod: entity.bod,
        bodShow: entity.bodShow,
        bpTitle: entity.bpTitle,
        bpContent: entity.bpContent,
        gender: entity.gender,
        formattedDate: entity.formattedDate,
        userid: entity.userid);
  }
}
