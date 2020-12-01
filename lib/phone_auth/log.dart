import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auths/phone_auth/verify.dart';
import 'package:flutter_firebase_auths/screens/HomeScreen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var verificationID;
  String phone = "";
  String code;
  String name = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to Barta ',
                  style: TextStyle(
                    // color: Global.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  obscureText: false,
                  onChanged: (value) {},
                ),
                TextFormField(
                  obscureText: false,
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: _auth,
                  child: Text('Continue', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _auth() async {
    print(phone);
    String phoneNumber = "+91" + phone;
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSend,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  codeSend(String verificationID, [int forceResendingToken]) async {
    print("codeSend");
    print(verificationID);
    this.verificationID = verificationID;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => VerifyNo(verificationID)));
  }

  codeAutoRetrievalTimeout(String verificationId) async {
    print("codeAutoRetrievalTimeout + $verificationId");
    //print(verificationId);
  }

  verificationFailed(authException) async {
    print("verificationFailed");
    print(authException);
    print(authException.message);
  }

  verificationCompleted(AuthCredential auth) async {
    print("verificationCompleted");
    print(auth);
    final result = await firebaseAuth.signInWithCredential(auth);
    print(result.user.uid);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  pageChange(verificationId) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => VerifyNo(verificationID)));
  }
}
