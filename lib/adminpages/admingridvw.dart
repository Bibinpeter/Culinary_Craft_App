import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prj1/adminpages/admin_adding.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/adminpages/updatep1.dart';
import 'package:prj1/adminpages/models/model.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

List<Recipe> foodlists = [];

class _AdminHomeState extends State<AdminHome> {
  Future<void> getfooddetails() async {
    List<Recipe> foodlist = await getRecipes();
    setState(() {
      foodlists = foodlist;
    });
  }

  @override
  void initState() {
    getfooddetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 77, 101),
      body: Column(
        children: [
          foodlists.isEmpty
              ? const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Text(
                      "Foodlist data is not available..",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.5,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 3,
                      ),
                      itemCount: foodlists.length,
                      itemBuilder: (context, Index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Fooddetails(
                                  rrecipes: foodlists[Index],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 160,
                                width: 170,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.file(
                                    File(foodlists[Index].photo),
                                    fit: BoxFit.cover ,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 130,
                                left: 80,
                                child: IconButton(
                                  splashColor: Colors.lightBlue,
                                  onPressed: () async {
                                    await deleteRecipe(Index);
                                    setState(() {
                                      foodlists.removeAt(Index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Admin(),
          ));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

Future<void> deletePhoto(int key) async {
  final photoBox = await Hive.openBox<Recipe>('recipes');

  // Check if the box is empty
  if (photoBox.isEmpty) {
    // Handle the case where the box is empty
    print('The photos box is empty. Cannot delete.');
    return;
  }

  // Check if the key is within a valid range
  if (key < 0 || key >= photoBox.length) {
    // Handle the case where the key is out of range
    print('Invalid key. Cannot delete photo at index $key.');
    return;
  }

  // Delete the photo at the specified key
  await photoBox.deleteAt(key);
}