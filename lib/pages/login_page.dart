import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
        "Login Page",
        style: TextStyle(
          fontSize: 48,
          color: Colors.blue,
          fontWeight: FontWeight.bold
        ),
      )),
    );
  }
}
