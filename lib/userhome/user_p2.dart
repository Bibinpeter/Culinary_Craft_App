import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/adminpages/models/model.dart';
import 'package:prj1/userhome/product_details.dart';

class UsesP2 extends StatefulWidget {
  const UsesP2({Key? key}) : super(key: key);

  @override
  State<UsesP2> createState() => _UsesP2State();
}

class _UsesP2State extends State<UsesP2> {
  final TextEditingController _searchController = TextEditingController();
  List<Recipe> allRecipes = [];
  List<Recipe> filteredRecipes = [];

  Future<void> fetchRecipes() async {
    allRecipes = await getRecipes();
    updateFilteredRecipes();
  }

  void updateFilteredRecipes() {
    if (_searchController.text.isNotEmpty) {
      filteredRecipes = allRecipes
          .where((recipe) => recipe.title
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    } else {
      // If the search text is empty, show all recipes
      filteredRecipes = List.from(allRecipes);
    }
  }

  @override
  void initState() {
    fetchRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Group recipes by category
    Map<String, List<Recipe>> recipesByCategory = {};
    for (var recipe in filteredRecipes) {
      recipesByCategory.putIfAbsent(recipe.category, () => []);
      recipesByCategory[recipe.category]!.add(recipe);
    }

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
                  setState(() {  
                    updateFilteredRecipes();
                  });
                },
                controller: _searchController,
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
            if (filteredRecipes.isEmpty)
              const Padding(
                padding: EdgeInsets.all(98.0),
                child: Text("Food data is not available!!.."),
              )
            else
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recipesByCategory.length,
                    itemBuilder: (context, categoryIndex) {
                      var category =
                          recipesByCategory.keys.toList()[categoryIndex];
                      var recipesInCategory = recipesByCategory[category]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(category,
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 20)),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: recipesInCategory.length,
                              itemBuilder: (context, index) {
                                if (recipesInCategory.isNotEmpty &&
                                    index < recipesInCategory.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductItemScreen(
                                                      recipe: recipesInCategory[
                                                          index])),
                                        );
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.5),
                                                BlendMode.multiply,
                                              ),
                                              child: ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topLeft,
                                                    colors: [
                                                      Colors.black,
                                                      Colors.black
                                                          .withOpacity(0.6)
                                                    ],
                                                  ).createShader(bounds);
                                                },
                                                blendMode: BlendMode.dstIn,
                                                child: FadeInImage(
                                                  placeholder: const AssetImage(
                                                      "assets/images/foodplaceholder.png"),
                                                  image: FileImage(File(
                                                      allRecipes[index].photo)),
                                                  width: 140,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            child: Text(
                                              recipesInCategory[index].title,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(); // Return an empty container or placeholder widget
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
