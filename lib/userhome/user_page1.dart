import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/crud.dart';
import 'package:prj1/adminpages/models/model.dart';
import 'package:prj1/userhome/constrainsusrpage3.dart';
import 'package:prj1/userhome/userp3.dart';

class UserPage1 extends StatefulWidget {
  const UserPage1({super.key});

  @override
  State<UserPage1> createState() => _UserPage5State();
}

class _UserPage5State extends State<UserPage1> {
  final CategoriesScroller categoriesScroller = const CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    for (var post in responseList) {
      listItems.add(Container(
          height: 150, 
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color:  const Color.fromARGB(255, 0, 0, 0),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withAlpha(100),
                    blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(post["name"],
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Text(post["brand"],
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 20, 96, 8))),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(" Time : ${post["Time"]}",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: const Color.fromARGB(255, 0, 0, 0)))
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    }
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    getRecipeFN();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
         

        // backgroundColor: const Color.fromARGB(255, 0, 0, 0),

        body: Container(
          height: size.height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 14, 254, 230),
              Color.fromARGB(255, 221, 31, 120)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  blurRadius: 10,
                  spreadRadius: 1),
              BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  offset: Offset(-2.0, -2.0),
                  blurRadius: 10,
                  spreadRadius: 1),
            ],
          ),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 900),
                    autoPlayInterval: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                    enlargeFactor: 1,
                    animateToClosest: true,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {},
                  ),
                  items: <Widget>[
                    for (int i = 0; i < recipelist.length; i++)
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.file(
                              File(recipelist[i].photo),
                              fit: BoxFit.fitWidth,
                              width: 370,
                            ),
                          ),
                          Positioned.fill(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [
                                    0.0,
                                    0.5,
                                  ], // Adjust the stops for the desired effect
                                  colors: [
                                    const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(
                                            0.7), // Opacity at the top (0.8)
                                    const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(
                                            0.0), // Opacity at the bottom (0.5)
                                  ],
                                )),
                          )),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              recipelist[i].title,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          )
                        ],
                      )
                  ]),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 190),
                child: Text(
                  "Loyality cards",
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }

  void getRecipeFN() async {
    List<Recipe> recipe = await getRecipes();
    setState(() {
      recipelist = recipe;
    });
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({super.key});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/Imaginary World Through My Iphone.jpeg', // Replace with the path to your image
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 0,
                              ),
                              child: Text(
                                "Favorites",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                    
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Icon(Icons.favorite,color: Color.fromARGB(255, 208, 20, 7),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/Advertising.jpeg', // Replace with the path to your image
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 30,
                              ),
                              child: Text(
                                "Latest",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/Alex Lau Food — 2D Creative Artists.jpeg', // Replace with the path to your image
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 30,
                              ),
                              child: Text(
                                "Super\nSaved",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
