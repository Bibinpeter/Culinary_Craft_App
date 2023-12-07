import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/adminpages/models/model.dart';
import 'package:prj1/userhome/constrains_usrp1.dart';
import 'package:prj1/userhome/product_details.dart';

class BurgerList extends StatefulWidget {
  const BurgerList({Key? key, required this.selectedCategory}) : super(key: key);

  final String selectedCategory;

  @override
  _BurgerListState createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  late ScrollController _scrollController;
  late Map<String, dynamic> post;
  List<Recipe> allRecipes = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    post = FOOD_DATA.firstWhere((element) => element['name'] == widget.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const FadeInImage(
            placeholder: AssetImage("assets/images/foodplaceholder.png"),
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
                stops: const [0.2, 0.8],
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.8),
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
                    title: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        "${"Your " + post["name"]}List",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        const FadeInImage(
                          placeholder: AssetImage("assets/images/foodplaceholder.png"),
                          image: AssetImage("assets/images/julius-9zy3GaH8NKM-unsplash.jpg"),
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
                                Colors.black.withOpacity(0.4),
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
                  physics: const BouncingScrollPhysics(),
                  itemCount: foodlists.length,
                  itemBuilder: (context, index) {
                    var category = foodlists[index];
                    var imageUrl = category.photo;

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(_createPageRoute(category));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                                      BlendMode.multiply,
                                    ),
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.9),
                                            Colors.black,
                                          ],
                                        ).createShader(bounds);
                                      },
                                      blendMode: BlendMode.dstIn,
                                      child: FadeInImage(
                                        placeholder: const AssetImage('assets/images/foodplaceholder.png'), // Replace with your placeholder image
                                        image: FileImage(File(imageUrl)),
                                        fit: BoxFit.cover,
                                        height: 200,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 150, left: 5),
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
                                        style: GoogleFonts.poppins(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 170, left: 10),
                                  child: Text(
                                    category.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _createPageRoute(category) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ProductItemScreen(recipe: category);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
