import 'package:flutter/material.dart';

class Album {
  final String name;
  final String email;
  final String password;
  final String address;
  final String id;
  Album(
      {@required this.name,
      @required this.email,
      @required this.password,
      @required this.address,
      @required this.id});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        address: json['address'],
        id: json['_id']);
  }
}
