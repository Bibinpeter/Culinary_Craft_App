import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/models/model.dart';
import 'package:prj1/userhome/burgerlist_usr.dart';
import 'package:prj1/userhome/constrains_usrp1.dart';
import 'package:prj1/userhome/fav_page.dart';
import 'package:prj1/userhome/latest.dart';

class UserPage1 extends StatefulWidget {
  const UserPage1({super.key});

  @override
  State<UserPage1> createState() => _UserPage1State();
}

class _UserPage1State extends State<UserPage1> {
  List<Recipe> recipelist = [];
  List<Widget> itemsData = [];
  final CategoriesScroller categoriesScroller =  CategoriesScroller(recipelist: [],);
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    for (var post in responseList) {
      listItems.add(

          ///////////////////////////////////////fetching the corresponding item////////////////////////////////////
          InkWell(
        onTap: () {
          fetchRecipesByCategory(categoryofFood: post['name']);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerList(
                    selectedCategory: post['name'],
                  )));
        },
        child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0).withAlpha(100),
                      blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                              fontSize: 10,
                              color: const Color.fromARGB(255, 81, 84, 81))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.update, color: Colors.blueGrey),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("${post["Time"]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: const Color.fromARGB(255, 0, 0, 0)))
                        ],
                      ),
                    ],
                  ),
                  FadeInImage(
                    placeholder: const AssetImage(
                        'assets/images/forkplaceholder.png'), // Replace with your placeholder image
                    image: AssetImage("assets/images/${post["image"]}"),
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ],
              ),
            )),
      ));
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
        closeTopContainer = controller.offset > 90;
      });
    });
  }

  void getRecipeFN() async {
    List<Recipe> recipe = await getRecipes();
    setState(() {
      recipelist = recipe;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    ////////////scaffold//////////////////
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 107, 255, 250), // Replace with your desired gradient colors
                  Color.fromARGB(255, 48, 185, 181),
                ],
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Home",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255), // Text color
              fontSize: 22,
            ),
          ),
        ),
      ),
      extendBody: true,
      // backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 14, 254, 230),
            Color.fromARGB(255, 255, 25, 133)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                blurRadius: 10,
                spreadRadius: 2),
            BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255),
                offset: Offset(-2.0, -2.0),
                blurRadius: 10,
                spreadRadius: 2),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 190, top: 5),
              child: Text(
                "Recipes for You",
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 134, 132, 132), fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            /////////////////////////////carousel/////////////////////////////
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                enlargeFactor: 1,
                animateToClosest: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {},
              ),
              items: <Widget>[
                for (int i = 0; i < recipelist.length; i++)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        FadeInImage(
                          fadeInCurve: Curves.bounceInOut,
                          placeholder: const AssetImage(
                              'assets/images/foodplaceholder.png'),
                          image: FileImage(File(recipelist[i].photo)),
                          fit: BoxFit.fitWidth,
                          width: 370,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.6),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 190),
              child: Text(
                "Loyality cards",
                style: GoogleFonts.poppins(
                    fontSize: 18, color: const Color.fromARGB(255, 70, 69, 69)),
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
                  child: CategoriesScroller(recipelist: recipelist)),
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
                      //////////////////////////////////////////////////scrolling effects///////////////////////////////////
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          transform: Matrix4.identity()..scale(scale, scale),
                          alignment: Alignment.bottomCenter,
                          child: Align(
                              heightFactor: 0.7, //stack like height
                              alignment: Alignment.topCenter,
                              child: itemsData[index]),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  /////////////////////////////////////////////////containers//////////////////////////////
  const CategoriesScroller({super.key, required this.recipelist});
final List<Recipe> recipelist;
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
              child: Row(children: <Widget>[
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoritesPage(),
                  )),
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Stack(
                        children: <Widget>[
                          const FadeInImage(
                            placeholder: AssetImage(
                                "assets/images/foodplaceholder.png"), // Replaced with my placeholder image.
                            image: AssetImage(
                                "assets/images/Imaginary World Through My Iphone.jpeg"),
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
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 208, 20, 7),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () { List<Recipe> listset=[];
                    for (var v = 0;v< recipelist.length-3;  v++) {
                      listset.add(recipelist[v]);
                    }
                    
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) =>
                            Latest(recipelist: listset.toList()))));
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Stack(
                        children: <Widget>[
                          const FadeInImage(
                            placeholder: AssetImage(
                                "assets/images/foodplaceholder.png"), // Replace with your placeholder image
                            image: AssetImage("assets/images/Advertising.jpeg"),
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Stack(
                      children: <Widget>[
                        const FadeInImage(
                          placeholder: AssetImage(
                              "assets/images/foodplaceholder.png"), // Replace with your placeholder image
                          image: AssetImage(
                              "assets/images/Alex Lau Food — 2D Creative Artists.jpeg"),
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
                                  " Easiest\n",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight
                                        .w500,  
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }
}
