import 'package:flutter/material.dart';

Widget buildIngredientsList() {
  return Container(
    height: 500,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ingredient ${index + 1} tapped!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: ListTile(
              leading: Icon(Icons.check),
              title: Text('Ingredient ${index + 1}'),
            ),
          ),
        );
      },
    ),
  );
}