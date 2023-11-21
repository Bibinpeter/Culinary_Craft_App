import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prj1/adminpages/categorycl.dart';
import 'package:prj1/adminpages/crud.dart';
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
TextEditingController festiEditingController = TextEditingController();
TextEditingController latestEditingController = TextEditingController();

File? selectImages;
 String dropdownvalue='Indian';

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
    festiEditingController =
        TextEditingController(text: widget.rrecipes.festivalrelated);
    latestEditingController =
        TextEditingController(text: widget.rrecipes.latest);
    selectImages = File(widget.rrecipes.photo);
  }

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
               DropDownButtonFields(hintText: "category",
                listName: categories,
                item: false, 
                onChanged: (newvalues){
                  setState(() {
                    dropdownvalue=newvalues!;
                  });
                }),
            SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: festiEditingController,
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
                controller: latestEditingController,
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
      festivalrelated: festiEditingController.text,
      latest: latestEditingController.text,
      photo: selectImages!.path,
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
