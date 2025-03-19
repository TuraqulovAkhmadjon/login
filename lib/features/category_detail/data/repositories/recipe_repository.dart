import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_model.dart';

import '../../../review/data/models/review_model.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;
  Map<int, List<RecipeModel>> recipesByCategory = {};

  Future<List<RecipeModel>> fetchRecipesByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) && recipesByCategory[categoryId] != null) {
      return recipesByCategory[categoryId]!;
    }

    var rawRecipes = await client.fetchRecipesByCategories(categoryId);
    final recipes = rawRecipes.map((recipe) => RecipeModel.fromJson(recipe)).toList();

    recipesByCategory[categoryId] = recipes;
    return recipes;

  }

}
