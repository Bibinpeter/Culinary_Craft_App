

import 'package:flutter/material.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/userhome/bottomnav.dart';

class UserHome extends StatefulWidget {
   UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  AuthService authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: const Center(
        child: Text(
          "user home page",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{ 
         await authService.signOut;
         // ignore: use_build_context_synchronously
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNav(),), (route) => false);
         
        }, // You can change the icon based on your requirement
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add), // You can change the button's background color
      ),
    );
  }
}
