import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_user_model.dart';

class Review_user_Model {
  final int id;
  final String title;
  final String photo;
  final int reviewsCount;
  final num rating;

  final RecipeDetailUserModel userModel;

  Review_user_Model({
    required this.id,
    required this.title,
    required this.photo,

    required this.rating,
    required this.reviewsCount,
    required this.userModel,
  });

  factory Review_user_Model.fromJson(Map<String, dynamic> json) {
    return Review_user_Model(
      id: json["id"],
      title: json["title"],
      photo: json["photo"],
      reviewsCount: json["reviewsCount"],
      rating: json["rating"],
      userModel: RecipeDetailUserModel.fromJson(json["user"]),
    );
  }
}
