import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prj1/adminpages/admingridvw.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prj1/adminpages/categoryclass.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/models/category.dart';
import 'package:prj1/models/model.dart';

class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _AdminLoginState();
}
String? categorySelector;
class _AdminLoginState extends State<Admin> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _timeEditingController = TextEditingController();
  final TextEditingController _decorEditingController = TextEditingController();
  final TextEditingController _categEditingController = TextEditingController();
  final TextEditingController _ingredientsEditingController =
      TextEditingController();
  final TextEditingController _procedureEditingController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();
  String dropdownvalue='Indian';

  File? selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 79, 100, 100),
          title: const Center(child: Text("Admin module")),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 79, 100, 100),
                ),
                curve: Curves.bounceInOut,
                child: Text(
                  'Sections of pages ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AdminHome()),
                  );
                },
              ),
              ListTile(
                title: const Text('Item 4'),
                onTap: () {
                  // Handle drawer item 2 tap
                },
              ),
              ListTile(
                title: const Text('Item 5 '),
                onTap: () {
                  // Handle drawer item 2 tap
                },
              ),
              // Add more ListTile widgets for additional drawer items
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(23),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: selectImage == null
                                ? null
                                : FileImage(selectImage!),
                          ),
                        ),
                        onTap: () async {
                          File? imgFrmFn = await imagePickFromGallery(context);
                          setState(() {
                            selectImage = imgFrmFn;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _titleEditingController,
                        decoration: InputDecoration(
                          labelText: 'title',
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          hintText: "title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Recipes tittle cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _timeEditingController,
                        decoration: InputDecoration(
                          labelText: 'Time required for making',
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          hintText: "Time",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'time cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _decorEditingController,
                        decoration: InputDecoration(
                          labelText: 'descrption',
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          hintText: "description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'description name cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropDownButtonFields(hintText:  "category",
                       listName: categoryy,
                        item: false, 
                        onChanged:(newvalue){
                          setState(() {
                            dropdownvalue=newvalue!;
                          });
                        }),
                    
                       const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLines: null,
                        controller: _ingredientsEditingController,
                        decoration: InputDecoration(
                          labelText: 'ingredients',
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          hintText: "ingred",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'category cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLines: null,
                        controller: _procedureEditingController,
                        decoration: InputDecoration(
                          labelText: 'procrdure',
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          hintText: "procedure",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'category cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  if (selectImage == null) {
                                    snackbarFunction(
                                      context,
                                      "Please Select an image",
                                      Colors.redAccent,
                                    );
                                  } else {
                                    // Create a Recipe instance
                                    final variableReceipes = Recipe(
                                      title: _titleEditingController.text,
                                      time: _timeEditingController.text,
                                      description: _decorEditingController.text,
                                      category: categorySelector!,
                                      procedure: _procedureEditingController.text,
                                      // Use an empty string if selectImage is null
                                      photo: selectImage?.path ?? "",
                                      incredients: _ingredientsEditingController.text,
                                      favoritesUserIds: [],
                                    );

                                    // Call the addRecipe method of RecipeData

                                    await addRecipe(variableReceipes);

                                    // Clear the form after adding the recipe
                                    _titleEditingController.clear();
                                    // ignore: use_build_context_synchronously
                                    _timeEditingController.clear();
                                    _decorEditingController.clear();
                                    _categEditingController.clear();
                                    _ingredientsEditingController.clear();
                                    _procedureEditingController.clear();

                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const AdminHome(),
                                      ),
                                    );
                                    // ignore: use_build_context_synchronously
                                    snackbarFunction(
                                      context,
                                      "Datas uploaded successfully ",
                                      const Color.fromARGB(255, 3, 238, 42),
                                    );
                                    setState(() {
                                      selectImage = null;
                                    });
                                  }
                                }
                              },
                              child: const Text("Add"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ]),
                    ]))));
  }
}

class _DropDownButtonFieldState {
}

Future<File?> imagePickFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    snackbarFunction(context, e.toString(), Colors.red);
  }
  return image;
}

void snackbarFunction(BuildContext context, String content, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: color,
  ));
}
 