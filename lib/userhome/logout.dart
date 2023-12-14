import 'package:flutter/material.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/userhome/Login.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  // ignore: use_key_in_widget_constructors
  const LogoutButton({required this.onPressed});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () async {
  await AuthService().signOut();
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const Login()),
    (route) => false,
  );
}, child: const Text('logout')),

    );
  }
}
