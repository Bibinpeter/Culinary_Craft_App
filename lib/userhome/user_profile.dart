import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prj1/indropages/widgets/helper/helper.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/services/database_services.dart';
import 'package:prj1/userhome/Login.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prj1/userhome/about_page.dart';
import 'package:prj1/userhome/termsandpri_page.dart';

class userP4 extends StatefulWidget {
  final String? userId;
  final String? nameofuser;

  userP4({
    Key? key,
    this.userId,
    this.nameofuser,
  }) : super(key: key);

  @override
  State<userP4> createState() => _userP4State();
}

AuthService authService = AuthService();
Stream<DocumentSnapshot>? userDatastream;

class _userP4State extends State<userP4> {
  String? emailofuser;
  String? nameofuser;
  String? imageUrl;
  String? userProfile;

  @override
  void initState() {
    super.initState();
    getUserEmailFromSF();
    getUserNameFromSF();
    userDatastream = DatabaseService().getuserdetails(widget.userId ?? "");
    debugPrint('id on profile: ${widget.userId}');
  }

  Future<void> _showImagePicker(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    try {
      if (pickedFile != null) {
        Reference referenceImageToUpLoad =
            FirebaseStorage.instance.ref().child(widget.userId ?? "");
        await referenceImageToUpLoad.putFile(File(pickedFile.path));
        imageUrl = await referenceImageToUpLoad.getDownloadURL();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    await DatabaseService().userCollection.doc(widget.userId).update({"profile": imageUrl});
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll( Color.fromARGB(255, 48, 162, 151),)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
               style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll( Color.fromARGB(255, 48, 162, 151),)),
              onPressed: () {
                authService.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Login()),
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
                          padding: const EdgeInsets.only(bottom: 5),
                          child: FloatingActionButton(
                            elevation: 9,
                            backgroundColor:
                                const Color.fromARGB(255, 48, 162, 151),
                            onPressed: () {
                              _showLogoutConfirmationDialog(context);
                            },
                            child: const Icon(Icons.logout),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
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
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 30),
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
                      child: StreamBuilder(
                          stream: userDatastream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: Image.asset('assets/images/user4.png'),
                              );
                            }
                            if (!snapshot.hasData) {
                              return const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 20,
                              );
                            }
                            if (snapshot.hasData) {
                              final userDataSnapshot =
                                  snapshot.data!.data() as Map<String, dynamic>;

                              userProfile = userDataSnapshot['profile'];

                              debugPrint('url on profile: $userProfile');

                              return CircleAvatar(
                                backgroundImage: userProfile == ""
                                    ? Image.asset('assets/images/user4.png').image
                                    : Image.network(userProfile ?? "").image,
                                radius: 20,
                              );
                            }
                            return const SizedBox();
                          }),
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
                ProfileDetailCard(
                  label: 'Username',
                  value: nameofuser ?? '',
                ),
                ProfileDetailCard(
                  label: 'Email id',
                  value: emailofuser ?? '',
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const TermsandPrivacy()),
                    );
                  },
                  child: ProfileDetailCard(
                    label: 'Terms and privacy',
                    value: 'Describes our policy',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const About()),
                    );
                  },
                  child: ProfileDetailCard(
                    label: 'About us',
                    value: 'version 1.0.0',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  getUserNameFromSF() async {
    await HelperFunctions.getUserNameFromSF().then((value) {
      if (value != null) {
        setState(() {
          nameofuser = value;
        });
      }
    });
  }

  getUserEmailFromSF() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      if (value != null) {
        setState(() {
          emailofuser = value;
        });
      }
    });
  }
}

// ignore: must_be_immutable
class ProfileDetailCard extends StatelessWidget {
   String label;
  String value;

  ProfileDetailCard({
    Key? key,
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
      ).createShader(
          Rect.fromPoints(Offset.zero, Offset(size.width, size.height)));

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
