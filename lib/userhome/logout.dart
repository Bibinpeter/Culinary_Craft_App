import 'package:flutter/material.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/userhome/Login.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  LogoutButton({required this.onPressed});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () async {
  await AuthService().signOut();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => Login()),
    (route) => false,
  );
}, child: Text('logout')),

    );
  }
}
