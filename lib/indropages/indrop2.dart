import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Page2({Key? key});

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
                    image: AssetImage(
                        "assets/images/chicken-soup-with-vegetables-spices-homemade-noodles-dark-table.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)),  
                ),
                height: 600,  
                width: 350,  
              ),
            ),
            const SizedBox(height: 20),  
            const Text(
              "Try the new premium recipies.",
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
