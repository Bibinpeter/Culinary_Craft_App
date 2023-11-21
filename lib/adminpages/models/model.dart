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
  final String latest;  
 
  @HiveField(5)
  final String festivalrelated;  
  
  @HiveField(6)
  final String time;  

// Constructor
  Recipe({
  required this.title, 
  required this.description, 
  required this.photo,
  required this.category,
  required this.latest,
 required this.festivalrelated, 
 required this.time
 
 }
);
}
