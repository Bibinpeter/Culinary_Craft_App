// recipe_data.dart

import 'package:hive/hive.dart';
import 'package:prj1/adminpages/models/model.dart';

Future<void> addRecipe(Recipe values) async {
  final recipeBox=await Hive.openBox<Recipe>('recipes');
  await recipeBox.add(values);
}

Future<List<Recipe>> getRecipes() async {
  final recipeBox = await Hive.openBox<Recipe>('recipes');
  return recipeBox.values.toList();
}

Future<int> getKey(Recipe recipiesToGetKey) async {
  final recipeBox = await Hive.openBox<Recipe>('recipes');
  final key =
      recipeBox.keyAt(recipeBox.values.toList().indexOf(recipiesToGetKey));
  return key;
}

Future<void> updateRecipe(Recipe rrecipe, int key) async {
  var recipeBox = await Hive.openBox<Recipe>('recipes');
  await recipeBox.put(key, rrecipe);
}
Future<void> deleteRecipe(int key) async {
  final recipeBox = await Hive.openBox<Recipe>('recipes');

  // Check if the box is empty
  if (recipeBox.isEmpty) {
    // Handle the case where the box is empty
    print('The recipes box is empty. Cannot delete.');
    return;
  }

  // Check if the key is within a valid range
  if (key < 0 || key >= recipeBox.length) {
    // Handle the case where the key is out of range
    print('Invalid key. Cannot delete recipe at index $key.');
    return;
  }

  // Delete the recipe at the specified key
  await recipeBox.deleteAt(key);
}


