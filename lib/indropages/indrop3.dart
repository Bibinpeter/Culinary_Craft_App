import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 41, 65),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.0),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bon-vivant-qom5MPOER-I-unsplash (1).jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                height: screenSize.height * 0.8, // Adjusted for different screen sizes
                width: screenSize.width * 0.9, // Adjusted for different screen sizes
              ),
            ),
            const SizedBox(height: 20), // Add space between image and text
            const Text(
              "Make a new experience. ",
              style: TextStyle(
                color: Color.fromARGB(255, 157, 161, 165),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      