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
  String loadingGif = 'assets/images/biggrSpn.gif';

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/nadine-primeau--ftWfohtjNw-unsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.2, 0.8],
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.4),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.12, // Adjusted for different screen sizes
            left: screenSize.width * 0.3, // Adjusted for different screen sizes
            child: Center(
              child: Image.asset(
                'assets/images/male-chef.png',
                width: screenSize.width * 0.4, // Adjusted for different screen sizes
                height: screenSize.width * 0.4, // Adjusted for different screen sizes
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.35, // Adjusted for different screen sizes
            left: screenSize.width * 0.3, // Adjusted for different screen sizes
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
            top: screenSize.height * 0.67, // Adjusted for different screen sizes
            left: screenSize.width * 0.35, // Adjusted for different screen sizes
            child: Text(
              "Get   ",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 248, 248, 248),
                fontWeight: FontWeight.w500,
                fontSize: screenSize.width * 0.15 , // Adjusted for different screen sizes
              ),
            ),
          ),
        Positioned(
  top: screenSize.height * 0.75, // Adjusted for different screen sizes
  left: screenSize.width * 0.2, // Adjusted for different screen sizes
  child: Column(
    children: [
      Text(
        "Cooking",
        style: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w500,
          fontSize: screenSize.width * 0.15, // Adjusted for different screen sizes
        ),
      ),
       
      ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
                width: screenSize.width * 0.1, // Adjusted for different screen sizes
                height: screenSize.width * 0.12, // Adjusted for different screen sizes
              ),
            ),
            const Text(
              "Start cooking ",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.01, // Adjusted for different screen sizes
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: screenSize.width * 0.03, // Adjusted for different screen sizes
            ),
          ],
        ),
      ),
    ],
  ),
),

        ],
      ),
    );
  }
}
