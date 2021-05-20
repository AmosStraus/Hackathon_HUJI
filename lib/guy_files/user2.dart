import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class UserField2 {
  static final String lastMessageTime = 'lastMessageTime';
}

class MyUser2 {
  final String idUser;
  final String name;
  final String urlAvatar;
  final int age;
  final String description;
  final String email;
  final String password;
  List<String> trips;
  final int created;
  final int attended;
  final int attending;
  final String address;

  MyUser2(
      {this.idUser = '0',
      @required this.name,
      @required this.urlAvatar,
      this.age = 0,
      this.description = "",
      this.email = "",
      this.password = "",
      @required this.trips,
      this.created = 0,
      this.attended = 0,
      this.attending = 0,
      this.address = "Jerusalem"});

  // These methods are for the database

  MyUser2 copyWith(
      {int idUser,
      String name,
      String urlAvatar,
      int age,
      String description,
      String email,
      String password,
      List<String> trips,
      int created,
      int attended,
      int attending,
      String address}) {
    return MyUser2(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        age: age ?? this.age,
        description: description ?? this.description,
        email: email ?? this.email,
        password: password ?? this.password,
        trips: trips ?? this.trips,
        created: created ?? this.created,
        attended: attended ?? this.attended,
        attending: attended ?? this.attending,
        address: address ?? this.address);
  }

  static MyUser2 fromJson(Map<String, dynamic> json) => MyUser2(
      idUser: json['idUser'],
      name: json['name'],
      urlAvatar: json['urlAvatar'],
      age: json['age'],
      description: json['description'],
      email: json['email'],
      password: json['password'],
      trips: json['trips'],
      created: json['created'],
      attended: json['attended'],
      attending: json['attending'],
      address: json['address']);

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'age': age,
        'description': description,
        'email': email,
        'password': password,
        'trips': trips,
        'created': created,
        'attended': attended,
        'attending': attending,
        'address': address
      };
}
