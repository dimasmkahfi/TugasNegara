import 'package:flutter/material.dart';
import 'package:tugaskulyah/screens/mainpage.dart';
import 'package:tugaskulyah/widgets/ingredients.dart';
import 'package:tugaskulyah/widgets/instruction.dart';
import 'package:tugaskulyah/widgets/recipeimage.dart';

void main() {
  runApp(CookbookApp());
}

class CookbookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookbook App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

void _showCategoryCreationAlert(BuildContext context, String category) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text('Category "$category" has been created!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}


class HomePage extends StatelessWidget {
  final TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
  }

  void _handleMenuButtonPress(BuildContext context, String category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to navigate to $category?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeGridPage(category: category)),
                );
                _showCategoryCreationAlert(context, category);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cookbook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String category = _categoryController.text.trim();
                if (category.isNotEmpty) {
                  _handleMenuButtonPress(context, category);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a category.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  buildMenuButton(
                      context, 'Breakfast', Icons.local_cafe),
                  buildMenuButton(context, 'Lunch', Icons.fastfood),
                  buildMenuButton(context, 'Dinner', Icons.restaurant),
                  buildMenuButton(context, 'Dessert', Icons.cake),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton(
      onPressed: () => _handleMenuButtonPress(context, title),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}



