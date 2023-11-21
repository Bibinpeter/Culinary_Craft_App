import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Page3({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 41, 65),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bon-vivant-qom5MPOER-I-unsplash (1).jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)), // Set the border radius here
                ),
                height: 600, // Set the desired height of the image
                width: 350, // Set the desired width of the image
              ),
            ),
            const SizedBox(height: 20), // Add space between image and text
            const Text(
              "Make a new experience. ",
              style: TextStyle(
                 color: Color.fromARGB(255, 157, 161, 165),
                fontSize: 18 ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
