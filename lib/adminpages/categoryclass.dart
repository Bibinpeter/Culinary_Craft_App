 import 'package:flutter/material.dart';
import 'package:prj1/adminpages/admin_adding.dart';

class DropDownButtonFields extends StatefulWidget {
  const DropDownButtonFields({
    Key? key,
    required this.hintText,
    required this.listName,
    required this.item,
    required this.onChanged,
    this.categorySelectedValue,
  }) : super(key: key);

  final String hintText;
  final List<List<String>> listName;
  final bool item;
  final ValueSetter<String?> onChanged;
  final String? categorySelectedValue;

  @override
  State<DropDownButtonFields> createState() => _DropDownButtonFieldState();
}

class _DropDownButtonFieldState extends State<DropDownButtonFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black, width: 0),
          ),
          labelStyle: const TextStyle(color: Colors.black),
        ),
        value: categorySelector, // Corrected value
        style: const TextStyle(color: Colors.black),
        onChanged: (newValue) {
          //widget.onChanged(newValue);
          categorySelector=newValue;
          setState(() {
            
          });
        },
        items: widget.listName.expand((categoryModel) {
          return categoryModel.map<DropdownMenuItem<String>>((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          });
        }).toList(),
      ),
   );
   }
  }