import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_user_model.dart';

class ReviewModel {
  final int id;
  final String title;
  final String photo;
  final int reviewsCount;
  final num rating;

  final RecipeDetailUserModel userModel;

  ReviewModel({
    required this.id,
    required this.title,
    required this.photo,

    required this.rating,
    required this.reviewsCount,
    required this.userModel,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json["id"],
      title: json["title"],
      photo: json["photo"],
      reviewsCount: json["reviewsCount"],
      rating: json["rating"],
      userModel: RecipeDetailUserModel.fromJson(json["user"]),
    );
  }
}
