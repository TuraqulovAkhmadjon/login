import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_user_model.dart';

import 'ingredients_model.dart';
import 'instructions_model.dart';

class RecipeDetailModel {
  final int id, category, timeRequired;
  final String title, description, photo, videoRecipe;
  final num rating;
  final RecipeDetailUserModel userModel;
  final List<InstructionsModel> instructionsModel;
  final List<IngredientsModel> ingredientsModel;

  RecipeDetailModel(
      {required this.id,
      required this.category,
      required this.timeRequired,
      required this.title,
      required this.description,
      required this.photo,
      required this.videoRecipe,
      required this.rating,
      required this.userModel,
      required this.ingredientsModel,
      required this.instructionsModel});

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json["id"],
      category: json["categoryId"],
      timeRequired: json["timeRequired"],
      title: json["title"],
      description: json["description"],
      photo: json["photo"],
      videoRecipe: json["videoRecipe"],
      rating: json["rating"],
      userModel: RecipeDetailUserModel.fromJson(json["user"]),
      ingredientsModel: (json["ingredients"] as List<dynamic>).map((ingredient)=>IngredientsModel.fromJson(ingredient)).toList(),
      instructionsModel: (json["instructions"] as List<dynamic>).map((instruction)=>InstructionsModel.fromJson(instruction)).toList(),
    );
  }
}
