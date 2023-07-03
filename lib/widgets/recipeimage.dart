 import 'package:flutter/material.dart';
 
 Widget buildRecipeImage() {
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
      child: Image.network(
        'https://www.teakpalace.com/image/cache/catalog/artikel/gambar-makanan-paling-enak-sate-kambing-1000x750h.jpg',
        fit: BoxFit.fill,
      ),
    ),
  );
}