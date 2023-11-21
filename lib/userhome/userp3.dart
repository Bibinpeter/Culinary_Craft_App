import 'package:flutter/material.dart';

import 'package:prj1/adminpages/crud.dart';
import 'package:prj1/adminpages/models/model.dart';

class usesP3 extends StatefulWidget {
   usesP3({super.key});

  @override
  State<usesP3> createState() => _usesP3State();
}

List<Recipe> recipelist = [];
List<Recipe> recipetxt = [];

class _usesP3State extends State<usesP3> {
  @override
  void initState() {
    getRecipeFN();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        
    );
  }

  void getRecipeFN() async {
    List<Recipe> recipe = await getRecipes();
    setState(() {
      recipelist = recipe;
    });
  }
}
