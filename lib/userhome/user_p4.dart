import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/userhome/Login.dart';
import 'dart:io';

import 'package:prj1/userhome/profile_update.dart';

class userP4 extends StatefulWidget {
  const userP4({Key? key}) : super(key: key);

  @override
  State<userP4> createState() => _userP4State();
}

AuthService authService = AuthService();

class _userP4State extends State<userP4> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 247, 255),
              Color.fromARGB(255, 193, 56, 143),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100),
                          child: FloatingActionButton(
                            elevation: 9, 
                            backgroundColor:   const Color.fromARGB(255, 48, 162, 151),
                            onPressed: () {
                              authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const Login()),
                                (route) => false,
                              );
                            },
                            child: const Icon(Icons.logout),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    "Profile",
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileUpdatePage(imageFile: _image)),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage: _image != null ? FileImage(_image!) : null,
                          radius: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 56, 119, 112),
                        child: IconButton(
                          onPressed: () {
                            _showImagePicker(context);
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const ProfileDetailCard(
                  label: 'Username',
                  value: 'widget.FirebaseAuth.name',
                  icon: Icons.abc,
                ),
                const ProfileDetailCard(
                  label: 'Login Date',
                  value: 'January 1, 2023fvdvdvdvdfvdvdfvdvddfvddfvdfv',
                  icon: Icons.abc,
                ),
                const ProfileDetailCard(
                  label: 'Terms and privacy',
                  value: 'FirebaseAuth.instance.currentUser.email',
                  icon: Icons.abc,
                ),
                const ProfileDetailCard(
                  label: 'About',
                  value: 'Passionate Flutter  vdfvdfvdfvdfvdfv',
                  icon: Icons.abc,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showImagePicker(BuildContext context) async {
    
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}

class ProfileDetailCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const ProfileDetailCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 222, 247, 242),
            Color.fromARGB(95, 255, 255, 255),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Text(
              value,
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 48, 162, 151),
          Color.fromARGB(255, 0, 255, 213),
        ],
      ).createShader(Rect.fromPoints(Offset.zero, Offset(size.width, size.height)));

    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}