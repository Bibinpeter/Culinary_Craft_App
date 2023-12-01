import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/indropages/dots_jumpind.dart';

class Showp extends StatefulWidget {
  const Showp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowpState createState() => _ShowpState();
}

class _ShowpState extends State<Showp> {
  bool isLoading = false;
  String loadingGif = 'assets/images/biggrSpn.gif'; // Path to your loading GIF
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/nadine-primeau--ftWfohtjNw-unsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Dark Gradient Overlay at the bottom
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
                ],  
                colors: [
                  Colors.black.withOpacity(0.7 ),  
                  Colors.black.withOpacity(0.4),  
                ],
              ),
            ),
          ),
          // Image on top of the background image
          Positioned(
            top: 100,
            left: 130,
            child: Center(
              child: Image.asset(
                'assets/images/male-chef.png',
                width: 135,
                height: 135,
              ),
            ),
          ),
          // Text under the last image
          Positioned(
            top: 240,
            left: 130,
            child: Text(
              "Premium Recipes",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 248, 248, 248),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            top: 540,
            left: 150,
            child: Text(
              "Get   ",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 248, 248, 248),
                fontWeight: FontWeight.w500,
                fontSize: 45,
              ),
            ),
          ),
          Positioned(
            top: 590,
            left: 105,
            child: Column(
              children: [
                Text(
                  "Cooking",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                    fontSize: 45,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ElevatedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Set the border radius here
      ),
    ),
    backgroundColor: MaterialStateProperty.all(
      const Color.fromARGB(136, 107, 213, 155),
    ),
  ),
  onPressed: () async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Welcm(),
    ));
  },
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Visibility(
        visible: isLoading,
        child: Image.asset(
          loadingGif,
          width: 55, // Set the width of the loading GIF
          height: 55, // Set the height of the loading GIF
        ),
      ),
      const Text(
        "Start cooking ",
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      const Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 15,
      ),
    ],
  ),
)

              ],
            ),
          ),
        ],
      ),
    );
  }
} 