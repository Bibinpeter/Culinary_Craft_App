import 'package:flutter/material.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/userhome/Login.dart';


class userP4 extends StatefulWidget {
  const userP4({super.key});

  @override
  State<userP4> createState() => _userP4State();
}
AuthService authService=AuthService();

class _userP4State extends State<userP4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           authService.signOut();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login(),), (route) => false);
          },
          child: const Text('logout'),
        ),
      ),
    );
  }
}
