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
                      context, 'Breakfast Recipes', Icons.local_cafe),
                  buildMenuButton(context, 'Lunch Recipes', Icons.fastfood),
                  buildMenuButton(context, 'Dinner Recipes', Icons.restaurant),
                  buildMenuButton(context, 'Dessert Recipes', Icons.cake),
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



class RecipeDetailsPage extends StatelessWidget {
  final String category;
  final int recipeIndex;

  RecipeDetailsPage({required this.category, required this.recipeIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Recipe ${recipeIndex + 1}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRecipeImage(),
            SizedBox(
              height: 16.0,
            ),
            Text(
                "Sate adalah hidangan populer di Asia Tenggara, terutama di Indonesia, Malaysia, Singapura, dan Thailand. Terdiri dari potongan daging atau bahan lain yang ditusuk ke tusuk sate, kemudian dipanggang dengan bumbu rempah khas. Sate sering disajikan dengan bumbu kacang, nasi putih, mentimun, dan bawang merah. Hidangan ini menjadi bagian integral dari masakan Indonesia dan telah diadopsi oleh budaya makanan di negara-negara sekitarnya."),
            SizedBox(height: 16.0),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            buildIngredientsList(),
            SizedBox(height: 16.0),
            Text(
              'Instructions',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            buildInstructionsList(),
          ],
        ),
      ),
    );
  }
}
