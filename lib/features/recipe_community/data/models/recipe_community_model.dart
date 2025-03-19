import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_user_model.dart';

class RecipeCommunityModel {
  final int id, timeRequired, reviewsCount;
  final String title, description, photo;
  final num rating;
  final DateTime created;

  final RecipeDetailUserModel userModel;

  RecipeCommunityModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.description,
    required this.timeRequired,
    required this.rating,
    required this.created,
    required this.reviewsCount,
    required this.userModel,
  });

  factory RecipeCommunityModel.fromJson(Map<String, dynamic> json) {
    return RecipeCommunityModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      photo: json["photo"],
      reviewsCount: json["reviewsCount"],
      created: DateTime.parse(json["created"]),
      timeRequired: json["timeRequired"],
      rating: json["rating"],
      userModel: RecipeDetailUserModel.fromJson(json["user"]),
    );
  }
}
