import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const About({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "ABOUT US",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to Recipe Creator App!",
                style: GoogleFonts.poppins(fontSize: 20,color: Colors.white)
              ),
              const SizedBox(height: 16),
              Text(
                "About the App:",
                 style: GoogleFonts.poppins(fontSize: 20,color: Colors.white)
              ),
              const SizedBox(height: 8),
              Text(
                "Recipe Creator is your go-to companion in the kitchen, empowering you to unleash your culinary creativity. Whether you're a seasoned chef or a home cook exploring new recipes, our app is designed to streamline the recipe creation process and enhance your cooking experience.",
                 style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              const SizedBox(height: 16),
              Text(
                "Key Features:",
              style: GoogleFonts.poppins(fontSize: 20,color: Colors.white)
              ),
              const SizedBox(height: 8),
              Text(
                "- Create and organize your recipes with ease.",
                style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              Text(
                "-  detailed information such as cooking time, ingredients, and procedures.",
                style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              Text(
                "- Customize and categorize recipes for quick access.",
                style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              Text(
                "- Explore a variety of recipes from our community.",
                 style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              const SizedBox(height: 16),
              Text(
                "Our Mission:",
                style: GoogleFonts.poppins(fontSize: 20,color: Colors.white)
              ),
              const SizedBox(height: 8),
              Text(
                "At Recipe Creator, our mission is to inspire and simplify your cooking journey. We believe that everyone can be a chef in their own kitchen, and our app is here to support you in creating delicious meals, trying new flavors, and sharing your culinary creations with the world.",
               style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              const SizedBox(height: 16),
              Text(
                "Contact Information:",
                style: GoogleFonts.poppins(fontSize: 20,color: Colors.white)
              ),
              const SizedBox(height: 8),
              Text(
                "If you have any questions, suggestions, or just want to say hello, we'd love to hear from you!",
              style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              const SizedBox(height: 10),
              Text(
                "Email: bibinpeter2018@gmail.com",
              style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
              const SizedBox(height: 16),
              Text(
                "Thank you for choosing Recipe Creator. Happy cooking!",
              style: GoogleFonts.poppins(fontSize: 14,color: Colors.white)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
