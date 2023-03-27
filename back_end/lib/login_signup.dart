import 'package:back_end/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dashboard.dart';
import 'login.dart';

class LoginSignup extends StatefulWidget {
  static const routeName = "/SignupLoginRoute";

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Signup()));
                                },
                                child: Text("New user")),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Login()));
                                },
                                child: Text("Already have an account")),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              DashBoard(
                                                  "Guest's name",
                                                  "Guest's email",
                                                  "pasword",
                                                  "Location",
                                                  "id")));
                                },
                                child: Text("Enter aa a guest"))
                          ],
                        ))))));
  }
}
