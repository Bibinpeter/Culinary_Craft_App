

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
           body: Center( 
             child: Container(
              height: 300,
              width: 300,
              color: Color.fromARGB(255, 145, 180, 243),
              child: Center(child: Text("about ",style: TextStyle(color: Colors.white,fontSize: 24 ),)),
             ),
             
           ),
    );
    
  }
}