import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
 late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        //////////////////////////////////////background image.................
        Image.asset(
          "assets/images/julius-9zy3GaH8NKM-unsplash.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
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
              ], // Adjust the stops for the desired effect
              colors: [
                Colors.black.withOpacity(0.8), // Opacity at the top (0.8)
                Colors.black.withOpacity(0.2), // Opacity at the bottom (0.5)
              ],
            ),
          ),
        ),
        NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: const Color.fromARGB(255, 0, 40, 46),
                  expandedHeight: 200.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Your Selected List',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Place the ColorFiltered Container below the Image
                        Image.asset(
                          "assets/images/julius-9zy3GaH8NKM-unsplash.jpg",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.2),
                                Color.fromARGB(255, 0, 0, 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: ValueListenableBuilder(
              valueListenable: recipenotifier,
              builder: (context, foodlists, child) {
                return ListView.builder(
                    itemCount: foodlists.length,
                    itemBuilder: (context, index) {
                      var category = foodlists[index];
                      var imageUrl = category.photo;

                      return InkWell(
                        onTap: () {
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>,))
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(0.2),
                                      BlendMode.multiply,
                                    ),
                                    child: Image.file(
                                      File(imageUrl),
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 150, left: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.update,
                                        color: Colors.amberAccent,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        category.time,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 170, left: 10),
                                  child: Text(
                                    category.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(0.7),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )),
      ],
    )
    );
          }
        
      
    
  }

