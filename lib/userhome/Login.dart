import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:prj1/adminpages/admingridvw.dart';
import 'package:prj1/indropages/widgets/helper/helper.dart';
import 'package:prj1/indropages/widgets/widgets.dart';
import 'package:prj1/reset_passwrd.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/services/database_services.dart';
import 'package:prj1/userhome/Loginstream/register.dart';

class Login extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isLoading = false;
  bool isGoogleloading = false;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/images/victoria-shes-Qa29U4Crvn4-unsplash.jpg',  
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Black Color Gradient Overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [
                  0.2,
                  0.8
                ], // Adjust the stops for the desired effect
                colors: [
                  Colors.black.withOpacity(0.8), // Opacity at the top (0.8)
                  Colors.black.withOpacity(0.5), // Opacity at the bottom (0.5)
                ],
              ),
            ),
          ),
          // GIF on top
          Positioned(
            top: 0, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/pizza.gif", // Replace with your GIF path
                    width: 160, // Adjust the width as needed
                    height: 160, // Adjust the height as needed
                  ),
                ),
                Text(
                  "Get recipes",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "LOGIN",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 45),
                ),
              ],
            ),
          ),

          // Your Login UI Components
          Center(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 350,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, left: 25),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: textInputDecoration.copyWith(
                                  labelText: "Email",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                validator: (value) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value!)
                                      ? null
                                      : "Please enter a valid email";
                                },
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 251, 251, 251))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, left: 25),
                            child: TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              decoration: textInputDecoration.copyWith(
                                labelText: "Password",
                                prefixIcon: const Icon(
                                  Icons.pin,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "Password must be at least 6 characters";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                         
                               Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 43, left: 28),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => ResetPage(),
                                          ));
                                        },
                                        child: Text(
                                          "Forgott password?",
                                          style: GoogleFonts.poppins(
                                              color: const Color.fromARGB(
                                                  255, 131, 171, 191)),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:42 ),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      const Register())));
                                        },
                                        
                                          child: Text(
                                            "Register here.",
                                            style: GoogleFonts.poppins(
                                                color: const Color.fromARGB(
                                                    255, 11, 238, 94)),
                                          ),
                                        ),
                                  ),SizedBox(width:18,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15 ,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () async {
                                          login();
                                        },
                                        splashColor:
                                            const Color.fromARGB(66, 0, 0, 0),
                                        backgroundColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        shape: const CircleBorder(),
                                        child: const Icon(
                                            Icons.follow_the_signs,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Login ",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "OR",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          Text(
                            "Login with ",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Logo(Logos.google),
                                onTap: () => authService.signInWithGoogle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {  
        if (value == UserCredentialConstant.user) {
          QuerySnapshot snapshot = 
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['email']);

          // ignore: use_build_context_synchronously
          nextScreenReplace(context, Page);
        } else if (UserCredentialConstant.admin == value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>const AdminHome()
              ),
              (route) => false);
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}