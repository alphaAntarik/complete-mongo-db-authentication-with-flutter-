import 'package:back_end/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dummy.dart';
import 'maposm.dart';

class DashBoard extends StatefulWidget {
  final String name, email, password, address, id;

  const DashBoard(this.name, this.email, this.password, this.address, this.id);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    bool onClicked = false;
    return (onClicked = false)
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Home"),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.map))
                  ],
                ),
              ),
              body: TabBarView(children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Container(
                          width: 220,
                          height: 40,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Username: ${widget.name}",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "user email: ${widget.email}",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                        ),
                        // Container(
                        //   child: Text(
                        //     password,
                        //     style: TextStyle(fontSize: 25),
                        //   ),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10)),
                        // ),
                        Container(
                          width: 220,
                          height: 40,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Address: ${widget.address}",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                onClicked = true;
                              });

                              // Navigator.of(context).pushNamed(
                              //   Dummy.route,
                              // );
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ),
                ),
                MapOSM(widget.name, widget.email, widget.password,
                    widget.address, widget.id)
              ]),
            ),
          )
        : UpdateScreen(widget.name, widget.email, widget.password,
            widget.address, widget.id);
  }
}
