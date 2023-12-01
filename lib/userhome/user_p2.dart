import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/adminpages/models/model.dart';

class UsesP2 extends StatefulWidget {
  const UsesP2({Key? key}) : super(key: key);

  @override
  State<UsesP2> createState() => _UsesP2State();
}

class _UsesP2State extends State<UsesP2> {
  final TextEditingController _searchcontroller = TextEditingController();
  List<Recipe> foodatas = [];

  Future<void> fetchRecipesearch() async {
    List<Recipe> allRecipes = await getRecipes();

    if (_searchcontroller.text.isNotEmpty) {
      foodatas = allRecipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(_searchcontroller.text.toLowerCase()))
          .toList();
    } else {
      // If the search text is empty, show all recipes
      foodatas = allRecipes;
    }

     
  }

  @override
  void initState() {
    fetchRecipesearch(); // Call fetchRecipesearch instead of getRecipes
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 74, 70, 70),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 14, 254, 230),
              Color.fromARGB(255, 255, 25, 133),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: TextFormField(
                onChanged: (value) {
                  fetchRecipesearch(); // Call fetchRecipesearch when text changes
                },
                controller: _searchcontroller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            foodatas.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(98.0),
                    child: Text("food data is not available!!.."),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 13),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 0.90,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: foodatas.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AboutBookScreen(
                              //       bookModel: foodatas[index],
                              //     ),
                              //   ),
                              // );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                             children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.multiply,
                                      ),
                                      child: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topLeft,
                                            colors: [Colors.black, Colors.black.withOpacity(0.6)],
                                          ).createShader(bounds);
                                        },
                                        blendMode: BlendMode.dstIn,
                                        child: Image.file(
                                          File(foodatas[index].photo),
                                          width: 180,
                                          height: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: Text(
                                      foodatas[index].title,
                                      style:  GoogleFonts.poppins(color: Colors.white)
                                    ),
                                  ),
                                ],
        ),
      );}
                      )
    )
                )
          ]
        )
      )
        );

  }
}
