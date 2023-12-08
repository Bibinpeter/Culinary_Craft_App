import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/userhome/Login.dart';

class Page1 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Page1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 41, 65),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/sebastian-coman-photography-eBmyH7oO5wY-unsplash.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              height: 600,
              width: 350,
            ),
            const SizedBox(
                height: 16), // Add space between image and FloatingActionButton
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(right: 280,top:00 ),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Login(),
                ));
              },
              splashColor: const Color.fromARGB(66, 1, 144, 89),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_forward,
                  color: Color.fromARGB(255, 24, 104, 161)),
            ),
          ),
          const SizedBox(
              height: 6), // Add space between FloatingActionButton and Text
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 280),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
             Text("Step in to the easy cooking",style: GoogleFonts.poppins(fontSize: 18 ,color:  const Color.fromARGB(255, 157, 161, 165),),)
            ],
          ),
            
        ],
        
      ),
      
    );
  }
}
