import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Instagram Clon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),),
            Padding(padding: EdgeInsets.all(50.0)),
            SignInButton(
                Buttons.Google,
                onPressed: (){}
            ),
          ],
        ),
      ),
    );
  }
}
