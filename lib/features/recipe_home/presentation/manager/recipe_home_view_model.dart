import 'package:flutter/material.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe_app/features/category_detail/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/catigories/data/models/categories_model.dart';
import 'package:recipe_app/features/catigories/data/repositories/repository.dart';

class RecipeHomeViewModel with ChangeNotifier {
  RecipeHomeViewModel({
    required CategoriesRepository catRepo,
    required RecipeRepository recipeRepo,
  })
      : _carRepo =catRepo,
        _recipeRepo = recipeRepo;
  final CategoriesRepository _carRepo;
  final RecipeRepository _recipeRepo;

  List<CategoriesModel>categories = [];
  List <RecipeModel>recipes = [];

  bool isLoading= true;


  late CategoriesModel _selected;
  CategoriesModel get selected=>_selected;

  set selected(CategoriesModel model){
    _selected =model;
    notifyListeners();
    fetchRecipeCategory(_selected.id);
  }
  Future<void> fetchRecipeCategory(int categoryId)async{
    recipes =await _recipeRepo.fetchRecipesByCategory(selected.id);
    notifyListeners();
  }

  Future <void> load()async{
    isLoading =true;
    notifyListeners();
    categories =await _carRepo.fetchCatigories();
    selected=categories.first;
    recipes =await _recipeRepo.fetchRecipesByCategory(selected.id,);
    isLoading =false;
    notifyListeners();
  }
}