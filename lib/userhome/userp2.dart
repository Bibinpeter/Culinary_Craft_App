import 'package:flutter/material.dart';

class usesP2 extends StatelessWidget {
  const usesP2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Color.fromARGB(255, 255, 0, 0) ,
          child: Center(child: Text("page2",style: TextStyle(color: Colors.white,fontSize: 23),)),
        ),
        
      ),
    );
  }
}