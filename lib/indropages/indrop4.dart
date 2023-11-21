import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prj1/Login.dart';

class Page4 extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Page4({Key? key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  bool _isLoading = false;
  final spinkits = const SpinKitChasingDots(
    size: 52,
    color: Color.fromARGB(255, 0, 0, 0)
  );

  void _handleFloatingButtonTap() async {
    setState(() {
      _isLoading = true;  
    });

     
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading =
          false;  
    });

     
    if (!_isLoading) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => Login())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 19, 41, 65),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/irina-jKh453Idils-unsplash.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)), 
                ),
                height: 600,  
                width: 350,  
              ),
            ),
          ),
          Positioned(
            bottom: 50,  
            right: 20,  
            child: Stack(
              alignment: Alignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _handleFloatingButtonTap();  
                  },
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.input,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                if (_isLoading) spinkits
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 690,left: 30),
            child: Text("Do more in quick and easy away. ",style: TextStyle(  color: Color.fromARGB(255, 157, 161, 165),fontSize: 18),
          )
          ),
           const Padding(
            padding: EdgeInsets.only(top: 708 ,left: 315, ),
            child: Text("Login",style: TextStyle(  color: Color.fromARGB(255, 255, 255, 255),fontSize: 16),
          )
          )
        ]));
  }
}
