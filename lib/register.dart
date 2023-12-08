import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/services/auth_service.dart';
import 'package:prj1/widgets/helper/helper.dart';
import 'package:prj1/widgets/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => LoginState();
}

class LoginState extends State<Register> with SingleTickerProviderStateMixin {
  bool isloading = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String username = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.translationValues(
                    MediaQuery.of(
                          context,
                        ).size.width *
                        _animation.value,
                    0,
                    0),
                child: child,
              );
            },
            child: Stack(children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'assets/images/victoria-shes-Qa29U4Crvn4-unsplash.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            const Color.fromARGB(
                                0, 0, 0, 0), // Fully transparent at the top
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                          ],
                        ),
                      ),
                      child: isloading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : SingleChildScrollView(
                              child: Form(
                                  key: formKey,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(-1, 2),
                                            end: Offset.zero,
                                          ).animate(_controller),
                                          child: Column(
                                            children: [
                                              ClipOval(
                                                child: Image.asset(
                                                  'assets/images/pizza.gif',
                                                  width: 160,
                                                  height: 160,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "GET  RECIPES",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "REGISTER",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 44),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 120,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 25, left: 25),
                                          child: TextFormField(
                                            decoration:
                                                textInputDecoration.copyWith(
                                              labelText: "user name",
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                username = value;
                                              });
                                            },
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                return null;
                                              } else {
                                                return "Name cannot be empty";
                                              }
                                            },
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25),
                                          child: TextFormField(
                                              decoration:
                                                  textInputDecoration.copyWith(
                                                labelText: "Email",
                                                prefixIcon: const Icon(
                                                  Icons.email,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
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
                                                  color: Colors.white)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25),
                                          child: TextFormField(
                                            obscureText: true,
                                            decoration:
                                                textInputDecoration.copyWith(
                                              labelText: "Password",
                                              prefixIcon: const Icon(
                                                Icons.pin,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
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
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 28),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 1,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 40, right: 30),
                                                child: FloatingActionButton(
                                                  onPressed: () {
                                                    register();
                                                  },
                                                  splashColor:
                                                      const Color.fromARGB(
                                                          66, 0, 0, 0),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 255, 255, 255),
                                                  shape: const CircleBorder(),
                                                  child: const Icon(
                                                      Icons.follow_the_signs,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 35, top: 15),
                                                child: Text(
                                                  "REGISTER",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ])))))
            ])));
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      await authService
          .registerUserWithEmailandPassword(username, email, password)
          .then((value) async {
        if (value == true) {
//////////////////////////////saving to shared preference///////////////////////////////
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserNameSF(username);
          await HelperFunctions.saveUserEmailSF(email);
          // ignore: use_build_context_synchronously
          nextScreenReplace(context, Page);
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            isloading = false;
          });
        }
      });
    }
  }
}
