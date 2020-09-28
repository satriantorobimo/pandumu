import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String name;
  final String password;
  final String email;
  final String phone;
  final String bio;
  final String bod;
  final bool bodShow;
  final String bpTitle;
  final String bpContent;
  final String gender;
  final String formattedDate;
  final String userid;

  UserEntity(
      this.username,
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
      this.userid);

  Map<String, Object> toJson() {
    return {
      "username": username,
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
      "bio": bio,
      "bod": bod,
      "bodShow": bodShow,
      "bpTitle": bpTitle,
      "bpContent": bpContent,
      "gender": gender,
      "formattedDate": formattedDate,
      "userid": userid
    };
  }

  @override
  List<Object> get props => [
        username,
        name,
        password,
        email,
        phone,
        bio,
        bod,
        bodShow,
        bpTitle,
        bpContent,
        gender,
        formattedDate,
        userid
      ];

  @override
  String toString() {
    return 'UserEntity { username : $username, name : $name, password : $password, email : $email, phone : $phone,bio : $bio,bod : $bod,bodShow : $bodShow,bpTitle : $bpTitle,bpContent : $bpContent,gender : $gender,formattedDate : $formattedDate, userid : $userid}';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
        json["username"] as String,
        json["name"] as String,
        json["password"] as String,
        json["email"] as String,
        json["phone"] as String,
        json["bio"] as String,
        json["bod"] as String,
        json["bodShow"] as bool,
        json["bpTitle"] as String,
        json["bpContent"] as String,
        json["gender"] as String,
        json["formattedDate"] as String,
        json["userid"] as String);
  }

  static UserEntity fromSnapshot(DocumentSnapshot snap) {
    return UserEntity(
        snap.data['username'],
        snap.data['name'],
        snap.data['password'],
        snap.data['email'],
        snap.data['phone'],
        snap.data['bio'],
        snap.data['bod'],
        snap.data['bodShow'],
        snap.data['bpTitle'],
        snap.data['bpContent'],
        snap.data['gender'],
        snap.data['formattedDate'],
        snap.documentID);
  }

  Map<String, Object> toDocument() {
    return {
      "username": username,
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
      "bio": bio,
      "bod": bod,
      "bodShow": bodShow,
      "bpTitle": bpTitle,
      "bpContent": bpContent,
      "gender": gender,
      "formattedDate": formattedDate,
      "userid": userid
    };
  }
}
