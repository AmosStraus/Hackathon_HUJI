import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class MyUser {
  final String idUser;
  final String name;
  final String urlAvatar;
  final int age;
  final String description;
  final String email;
  final String password;
  List<String> trips;

  MyUser({
    this.idUser = '0',
    @required this.name,
    @required this.urlAvatar,
    this.age = 0,
    this.description = "",
    this.email = "",
    this.password = "",
    @required this.trips,
  });

  // These methods are for the database

  MyUser copyWith(
      {int idUser,
      String name,
      String urlAvatar,
      int age,
      String description,
      String email,
      String password,
      List<String> trips}) {
    return MyUser(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        age: age ?? this.age,
        description: description ?? this.description,
        email: email ?? this.email,
        password: password ?? this.password,
        trips: trips ?? this.trips);
  }

  static MyUser fromJson(Map<String, dynamic> json) => MyUser(
      idUser: json['idUser'],
      name: json['name'],
      urlAvatar: json['urlAvatar'],
      age: json['age'],
      description: json['description'],
      email: json['email'],
      password: json['password'],
      trips: json['trips']);

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'age': age,
        'description': description,
        'email': email,
        'password': password,
        'trips': trips
      };
}


// import 'package:huji_hackathon/utils/utils.dart';
// import 'package:meta/meta.dart';

// class UserField {
//   static final String lastMessageTime = 'lastMessageTime';
// }

// class MyUser {
//   final String idUser;
//   final String name;
//   final String urlAvatar;
//   final DateTime lastMessageTime;
//   final int age;
//   final String email;
//   final String password;

//   const MyUser({
//     this.email,
//     this.password,
//     this.idUser,
//     this.age,
//     @required this.name,
//     @required this.urlAvatar,
//     @required this.lastMessageTime,
//   });

//   // These methods are for the database

//   MyUser copyWith(
//       {String idUser,
//       int age,
//       String name,
//       String urlAvatar,
//       String lastMessageTime,
//       String email,
//       String password}) {
//     return MyUser(
//         idUser: idUser ?? this.idUser,
//         age: age ?? this.age,
//         name: name ?? this.name,
//         urlAvatar: urlAvatar ?? this.urlAvatar,
//         lastMessageTime: lastMessageTime ?? this.lastMessageTime,
//         email: email ?? this.email,
//         password: password ?? this.password);
//   }

//   static MyUser fromJson(Map<String, dynamic> json) => MyUser(
//         idUser: json['idUser'],
//         age: json['age'],
//         name: json['name'],
//         urlAvatar: json['urlAvatar'],
//         lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
//         email: json['email'],
//         password: json['password'],
//       );

//   Map<String, dynamic> toJson() => {
//         'idUser': idUser,
//         'age': age,
//         'name': name,
//         'urlAvatar': urlAvatar,
//         'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
//         'email': email,
//         'password': password
//       };
// }
