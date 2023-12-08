import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResetPage(),
    );
  }
}

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
                'assets/images/forgott.jpg'), // Replace with your image asset path
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.5), // Set the black background opacity (0.5 means 50% opacity)
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(29),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  "RESET PASSWORD",
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 42,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Form(
                key: formKey,
                child: Column(children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        color: Colors.white), // Set text color to white
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      labelStyle: TextStyle(
                          color: Colors.white), // Set label color to white
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 159, 162,
                              159)), // Set hint text color to white
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Set border color to white
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .white), // Set focused border color to white
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
                  ),
                ]),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                   if (formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text)
          .then((value) => Navigator.of(context).pop());
    } else {
                    snackbarFunction(context, "Error ",
                                Colors.redAccent);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(
                          255, 90, 87, 87)), // Set button color to green
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Set button edge curve
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      const Size(150, 50)), // Set button size
                ),
                child: const Text('Reset password ',
                    style:
                        TextStyle(fontSize: 18)), // Increase button text size
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
 void snackbarFunction(BuildContext context, String content, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: color,
  ));
}
 