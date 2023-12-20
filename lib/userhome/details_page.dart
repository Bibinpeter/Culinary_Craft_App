import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/userhome/fav_page.dart';
import 'package:prj1/userhome/product_details.dart';

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
        const FadeInImage(
          placeholder: AssetImage(
              "assets/images/foodplaceholder.png"), // Replace with your placeholder image
          image: AssetImage("assets/images/julius-9zy3GaH8NKM-unsplash.jpg"),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
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
                        const FadeInImage(
                          placeholder: AssetImage(
                              "assets/images/foodplaceholder.png"), // Replace with your placeholder image
                          image: AssetImage(
                              "assets/images/julius-9zy3GaH8NKM-unsplash.jpg"),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.2),
                                const Color.fromARGB(255, 0, 0, 0),
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
                  

                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => ProductItemScreen(
                                recipe: category,
                                userProfile: userProfile,
                                userId: FirebaseAuth.instance.currentUser!.uid),
                          ));
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
                                      const Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(0.2),
                                      BlendMode.multiply,
                                    ),
                                    child: Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Fburger1.jpg?alt=media&token=b99d49d5-81e1-4cc4-9d77-9f8f4e5650fb', // Replace with your actual network image URL
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
                                      const Icon(
                                        Icons.update,
                                        color: Colors.amberAccent,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        category.time,
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 170, left: 10),
                                  child: Text(
                                    category.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: const Color.fromARGB(
                                              255, 255, 255, 255)
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
    ));
  }
}
