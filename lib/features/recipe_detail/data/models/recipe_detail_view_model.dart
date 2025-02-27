

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_model.dart';

import '../repositories/recipe_repository.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel(this.RecipeRepository, this._repo, this.recipeId, this.recipe, {required RecipeRepository recipeRepo,}): _recipeRepo;
  final RecipeRepository _repo;

  final RecipeRepository _recipeRepo;

  bool isLoading = true;
  final int recipeId;

  late  final RecipeDetailModel recipe;

  Future <void>load ()async{
    isLoading= true ;
    notifyListeners();

    recipe=await _recipeRepo.fetchRecipeById((recipeId));
    isLoading = false;
    notifyListeners();
  }

}
