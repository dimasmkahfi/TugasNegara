 import 'package:flutter/material.dart';
 
 Widget buildRecipeImage(String image) {
  print(image);
  return Card(
    elevation:5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Image.asset(
        'assets/$image.jpg',
        fit: BoxFit.fill,
      ),
    ),
  );
}