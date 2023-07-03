import 'package:flutter/material.dart';

import '../widgets/ingredients.dart';
import '../widgets/instruction.dart';
import '../widgets/recipeimage.dart';


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