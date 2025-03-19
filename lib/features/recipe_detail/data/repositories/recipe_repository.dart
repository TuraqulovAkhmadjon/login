import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_model.dart';

class RecipeDetailRepository {
  RecipeDetailRepository({required this.client});

  final ApiClient client;

  Map<int, List<RecipeDetailModel>> recipesByCategory = {};

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipe(recipeId);
    final recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe;
  }
}
