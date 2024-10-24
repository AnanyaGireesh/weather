import 'package:flutter/material.dart';
class CategoryModel{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
  List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'salad', 
        iconPath: 'assets/icons/salad.svg',
        boxColor: Color(0xffC588F2),
      )
    );

       categories.add(
      CategoryModel(
        name: 'vegetables', 
        iconPath: 'assets/icons/vegetables.svg',
        boxColor: Color(0xffC588F2),
      )
    );

       categories.add(
      CategoryModel(
        name: 'chicken', 
        iconPath: 'assets/icons/chicken.svg',
        boxColor: Color(0xffC588F2),
      )
    );

       categories.add(
      CategoryModel(
        name: 'pie', 
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xffC588F2),
      )
    );

       categories.add(
      CategoryModel(
        name: 'smoothie', 
        iconPath: 'assets/icons/smoothie.svg',
        boxColor: Color(0xffC588F2),
      )
    );
    return categories;
  }

}
