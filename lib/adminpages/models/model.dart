// recipe_model.dart

import 'package:hive/hive.dart';
part 'model.g.dart';
@HiveType(typeId: 0)
class Recipe extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String photo;  
  
  @HiveField(3)
  final String category;  
  
  @HiveField(4)
  final String procedure;  
 
  @HiveField(5)
  final String ingredients;  
  
  @HiveField(6)
  final String time;

  // ignore: prefer_typing_uninitialized_variables
  var categoryy;  

// Constructor
  Recipe({
  required this.title, 
  required this.description, 
  required this.photo,
  required this.category,
  required this.procedure,
 required this.ingredients, 
 required this.time
 
 }
);
}
