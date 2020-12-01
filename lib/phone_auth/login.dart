import 'package:flutter/material.dart';

import 'log.dart';

class AgreeAndStart extends StatefulWidget {
  @override
  _AgreeAndStartState createState() => _AgreeAndStartState();
}

class _AgreeAndStartState extends State<AgreeAndStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.black,
        body: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Center(
            child: Text(
              "Welcome to Barta",
              style: TextStyle(
                fontSize: 25,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Container(
            child: RichText(
              text: TextSpan(
                  text: "Read our Privacy Policy Tap AGREE AND CONTINUE to ",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: " accept the Terms of Service . . .",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        RaisedButton(
            child: Text("AGREE AND CONTINUE"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              );
            }),
        SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
