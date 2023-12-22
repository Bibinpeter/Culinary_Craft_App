
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/userhome/product_details.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

String? userProfile;

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 153, 241,
                    238), // Replace with your desired gradient colors
                Color.fromARGB(255, 0, 163, 158),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Your Favorites",
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255), // Text color
            fontSize: 22,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: favoriteNotifier,
        builder: (context, value, _) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 14, 254, 230),
                  Color.fromARGB(255, 255, 25, 133),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: value.isEmpty
                ? const Center(
                    child: Text(
                      'No favorites yet!',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 120,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ProductItemScreen(
                                          recipe: value[index],
                                          userProfile: userProfile,
                                          userId: FirebaseAuth
                                              .instance.currentUser!.uid,
                                        )),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                   Image(
                                    image: NetworkImage(value[index].photo), // Use NetworkImage for network images
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color.fromARGB(0, 0, 0, 0),
                                          const Color.fromARGB(255, 0, 0, 0)
                                              .withOpacity(0.5),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value[index].title,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
