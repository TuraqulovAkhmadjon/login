import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_model.dart';

import '../repositories/recipe_repository.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required RecipeDetailRepository recipeRepo,
    required this.recipeId,
  }) : _recipeRepo = recipeRepo {
    load();
  }
  final RecipeDetailRepository _recipeRepo;

  bool isLoading = true;
  final int recipeId;

   RecipeDetailModel? recipe;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    recipe = await _recipeRepo.fetchRecipeById((recipeId));
    isLoading = false;
    notifyListeners();
  }
}
