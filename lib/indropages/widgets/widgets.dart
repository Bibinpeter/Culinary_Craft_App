
import 'package:flutter/material.dart';
import 'package:prj1/Login.dart';
import 'package:prj1/userhome/hiddendrawer.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Color.fromARGB(255, 224, 221, 221), 
  fontWeight: FontWeight.w300),
    
  focusedBorder: UnderlineInputBorder(  
    borderSide: BorderSide(color: Color.fromARGB(255, 100, 238, 187), width: 2),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
}

void nextScreenReplace(context, page) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  HiddenDrawr()),(Route)=>true);
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}