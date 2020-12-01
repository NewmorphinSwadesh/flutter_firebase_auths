import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyNo extends StatefulWidget {
  final String verificationID;
  VerifyNo(this.verificationID);
  @override
  _VerifyNoState createState() => _VerifyNoState();
}

class _VerifyNoState extends State<VerifyNo> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  var verificationID;
  String phone = "";
  String code;
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            text(),
            FittedBox(
                fit: BoxFit.fill, child: Image.asset('assets/trail2.png')),
            sms(),
            Container(
              height: 10,
            ),
            button(context),
          ],
        ),
      ),
    );
  }

  __login() async {
    print(verificationID);
    final credential = await PhoneAuthProvider.getCredential(
        verificationId: widget.verificationID, smsCode: otp);
    try {
      final result = await firebaseAuth.signInWithCredential(credential);
      print(result);
    } catch (e) {
      print(e);
    }
  }

  button(context) {
    return Center(
      child: RaisedButton(
          child: Text("Verify"),
          onPressed: () async {
//            await Navigator.pushReplacement(
//              context,
//              MaterialPageRoute(builder: (context) => wappHome()),
//            );
            await __login();
          }),
    );
  }

  text() {
    return Center(
      heightFactor: 3,
      child: Text(
        "Verification of the given number",
        style: TextStyle(
            fontSize: 25, color: Colors.blueGrey, fontWeight: FontWeight.w900),
      ),
    );
  }

  sms() {
    return Padding(
      padding: EdgeInsets.only(left: 60, right: 60, top: 15),
      child: TextField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          otp = value;
        },
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "OTP",
            hintText: "--- --- --- --- --- ---",
            prefixIcon: Icon(Icons.sms),
            suffixIcon: Icon(Icons.visibility_off)),
      ),
    );
  }
}
