import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prj1/adminpages/categoryclass.dart';
import 'package:prj1/adminpages/hive_db.dart';
import 'package:prj1/adminpages/models/category.dart';
import 'package:prj1/adminpages/models/model.dart';

class Fooddetails extends StatefulWidget {
  Fooddetails({super.key, required this.rrecipes});
  final Recipe rrecipes;
  @override
  State<Fooddetails> createState() => _FooddetailsState();
}

final formkey = GlobalKey<FormState>();
TextEditingController titleEditingController1 = TextEditingController();
TextEditingController timeEditingController = TextEditingController();
TextEditingController descriEditingController = TextEditingController();
TextEditingController cateEditingController = TextEditingController();
TextEditingController _ingredientsEditingController = TextEditingController();
TextEditingController _procedureEditingController= TextEditingController();

File? selectImages;
 String dropdownvalue='Indian';
String? categorySelector;
class _FooddetailsState extends State<Fooddetails> {
  @override
  void initState() {
    super.initState();
    titleEditingController1 =
        TextEditingController(text: widget.rrecipes.title);
    timeEditingController = TextEditingController(text: widget.rrecipes.time);
    descriEditingController =
        TextEditingController(text: widget.rrecipes.description);
    cateEditingController =
        TextEditingController(text: widget.rrecipes.category);
    _ingredientsEditingController =
        TextEditingController(text: widget.rrecipes.ingredients);
    _procedureEditingController =
        TextEditingController(text: widget.rrecipes.procedure);
    selectImages = File(widget.rrecipes.photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 146, 148, 150),
      body: SafeArea(
          child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(23),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        selectImages == null ? null : FileImage(selectImages!),
                  ),
                ),
                onTap: () async {
                  File? imgFrmFn = await imagePickFromGallery(context);
                  setState(() {
                    selectImages = imgFrmFn;
                  });
                },
              ),
              TextFormField(
                controller: titleEditingController1,
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
                    return 'time cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: timeEditingController,
                decoration: InputDecoration(
                  labelText: 'Time required for making',
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: "time required fr it",
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
                controller: descriEditingController,
                decoration: InputDecoration(
                  labelText: 'description',
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: "description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'description cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,), 
               DropDownButtonFields(hintText: "category",
                listName: categoryy,
                item: false, 
                onChanged: (newvalues){
                  setState(() {
                    dropdownvalue=newvalues!;
                  });
                }),
            const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _ingredientsEditingController,
                decoration: InputDecoration(
                  labelText: 'festival',
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: "festival",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'description cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _procedureEditingController,
                decoration: InputDecoration(
                  labelText: 'latest',
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: "latest",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'description cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    updateRecipedatas();
                    Navigator.of(context).pop();
                    snackbarFunction(
                      context,
                      " updated successfully ",
                      const Color.fromARGB(255, 91, 255, 118),
                    );
                  },
                  child: const Text('update'))
            ],
          ),
        ),
      )),
    );
  }

  Future<void> updateRecipedatas() async {
    final updateRecipedata = Recipe(
      title: titleEditingController1.text,
      time: timeEditingController.text,
      description: descriEditingController.text,
      category: cateEditingController.text,
      ingredients: _ingredientsEditingController.text,
      procedure: _procedureEditingController.text,
      photo: selectImages?.path??"",
    );

    int key = getKeyofupdatedrecipe(widget.rrecipes);
    await updateRecipe(updateRecipedata, key);
  }

  int getKeyofupdatedrecipe(Recipe variableReceipes) {
    var box = Hive.box<Recipe>('recipes');
    var key = box.keyAt(box.values.toList().toList().indexOf(variableReceipes));
    return key;
  }
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
