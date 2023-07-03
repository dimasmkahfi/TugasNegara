import 'package:flutter/material.dart';
import 'package:tugaskulyah/screens/recipedetails.dart';

import '../main.dart';


class RecipeGridPage extends StatelessWidget {
  final String category;

  RecipeGridPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Recipes'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('$category Recipe ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeDetailsPage(
                        category: category, recipeIndex: index)),
              );
            },
          );
        },
      ),
    );
  }
}