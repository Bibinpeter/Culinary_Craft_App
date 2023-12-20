
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj1/models/model.dart';
import 'package:prj1/userhome/fav_page.dart';
import 'package:prj1/userhome/product_details.dart';

// ignore: must_be_immutable
class Latest extends StatefulWidget {
  Latest({Key? key, required this.recipelist}) : super(key: key);
  final List<Recipe> recipelist;
 String? userProfile;
  @override
  State<Latest> createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latest Recipes',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 64, 255, 249),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 94, 255, 255),
              Color.fromARGB(255, 169, 68, 128),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.75, // Adjusted aspect ratio for a more balanced look
            ),
            itemCount: widget.recipelist.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductItemScreen(
                          recipe: widget.recipelist[index],userProfile: userProfile,userId: FirebaseAuth.instance.currentUser!.uid,
                          
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        FadeInImage(
  placeholder: const AssetImage("assets/images/foodplaceholder.png"),
  image: NetworkImage(widget.recipelist[index].photo), // Use NetworkImage for network images
  width: double.infinity,
  height: double.infinity,
  fit: BoxFit.cover,
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
                            widget.recipelist[index].title,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                             
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
