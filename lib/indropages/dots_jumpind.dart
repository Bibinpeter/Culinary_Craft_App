import 'package:flutter/material.dart';
import 'package:prj1/indropages/indrop1.dart';
import 'package:prj1/indropages/indrop2.dart';
import 'package:prj1/indropages/indrop3.dart';
import 'package:prj1/indropages/indrop4.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Welcm extends StatelessWidget {
  final _controller = PageController();
  Welcm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: const Color.fromARGB(255, 19, 41, 65),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 750 ,
            child: PageView(
              controller: _controller,
              children: [
                Page1(),
                const Page2(),
               const Page3(),
                const Page4()
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: const JumpingDotEffect(
              verticalOffset: 40.0,  
              activeDotColor: Color.fromARGB(255, 255, 255, 255),
             spacing: 10,
              dotColor: Color.fromARGB(255, 47, 74, 117),
              dotHeight: 20,
              dotWidth: 20,
            ),
          )
        ],
      ),
    );
  }
}
