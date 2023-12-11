import 'dart:io';

import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatelessWidget {
  final File? imageFile;

  const ProfileUpdatePage({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      
      body: Center(
        child: CircleAvatar(
          backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
          radius: 300,  
        ),
      ),
    );
  }
}
