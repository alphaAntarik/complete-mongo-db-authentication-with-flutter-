import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import 'album.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

Future<Album> createAlbum(String id, String name, String email, String password,
    String address) async {
  final http.Response response = await http.put(
    Uri.parse('https://8686-45-112-68-160.in.ngrok.io/api/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'password': password,
      'address': address
    }),
  );

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class UpdateScreen extends StatefulWidget {
  final String name, email, password, address, id;

  UpdateScreen(this.name, this.email, this.password, this.address, this.id);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  Future<Album> _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_futureAlbum == null)
          ? Form(
              child: Padding(
              padding: EdgeInsets.all(3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('username'),
                    controller: _controller1,
                    autocorrect: true,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || value.length < 4) {
                        return 'Please enter at least 4 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: widget.name),
                  ),
                  TextFormField(
                    key: ValueKey('email'),
                    controller: _controller2,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: widget.email,
                    ),
                  ),
                  // TextFormField(
                  //   key: ValueKey('password'),
                  //   controller: _controller3,
                  //   validator: (value) {
                  //     if (value.isEmpty || value.length < 7) {
                  //       return 'Password must be at least 7 characters long.';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(labelText: widget.password),
                  //   obscureText: true,
                  // ),
                  TextFormField(
                    key: ValueKey('Address'),
                    controller: _controller4,
                    autocorrect: true,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || value.length < 4) {
                        return 'Please enter at least 4 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: widget.address),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DashBoard(
                                            widget.name,
                                            widget.email,
                                            widget.password,
                                            widget.address,
                                            widget.id)));
                          },
                          icon: Icon(Icons.arrow_left)),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _futureAlbum = createAlbum(
                                  widget.id,
                                  _controller1.text,
                                  _controller2.text,
                                  widget.password,
                                  _controller4.text);
                            });
                          },
                          icon: Icon(Icons.save)),
                    ],
                  )
                ],
              ),
            ))
          : FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DashBoard(
                      snapshot.data.name,
                      snapshot.data.email,
                      snapshot.data.password,
                      snapshot.data.address,
                      snapshot.data.id);
                  ;
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return const CircularProgressIndicator();
              },
            ),
    );
  }
}
