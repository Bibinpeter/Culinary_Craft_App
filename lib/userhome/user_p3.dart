import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/adminpages/models/model.dart';
import 'package:prj1/userhome/country_maplist.dart';
import 'package:prj1/userhome/details_page.dart';

class UsesP3 extends StatefulWidget {
  UsesP3({super.key});

  @override
  State<UsesP3> createState() => _UsesP3State();
}

class _UsesP3State extends State<UsesP3> {
  List<Recipe> recipelist = [];
  List<Widget> itemsData = [];
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  void getPostsData() {
    List<dynamic> responseList1 = COUNTRY_LIST;
    List<Widget> listItems = [];
    for (var post1 in responseList1) {
      listItems.add(
        InkWell(
          onTap: () {
            fetchRecipesByCategory(categoryofFood: post1['names']);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Details()));
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
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post1["names"],
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                  'assets/images/placeholder.png'), // Replace with your local placeholder image path
                              image: AssetImage(
                                "${post1["Flag"]}",
                              ),
                              // Replace with your actual image path
                              height: 26,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: FadeInImage(
                      placeholder: const AssetImage(
                          'assets/images/placeholder.png'), // Replace with your local placeholder image path
                      image: AssetImage(
                        "${post1["image"]}",
                      ),
                      // Replace with your actual image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
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
        getRecipes();
        getRecipeFN();
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
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.16;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Category',
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 0, 0, 0), fontSize: 22),
        )),
        backgroundColor: const Color.fromARGB(255, 91, 215, 215),
      ),
      extendBody: true,
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 14, 254, 230),
              Color.fromARGB(255, 255, 25, 133),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              blurRadius: 10,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              offset: Offset(-2.0, -2.0),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : categoryHeight,
                child: const CategoriesScroller1(),
              ),
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
                        child: itemsData[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesScroller1 extends StatelessWidget {
  const CategoriesScroller1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const FittedBox(
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            )));
  }
}
