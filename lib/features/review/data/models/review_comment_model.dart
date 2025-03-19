import 'package:recipe_app/features/review/data/models/reviewComment_user_model.dart';

import '../../../recipe_detail/data/models/recipe_detail_user_model.dart';

class ReviewCommentModel {
  final int id;
  final String comment;
  final num rating;
  final String image;
  final DateTime created;


  final ReviewCommentUserModel userModel;


  ReviewCommentModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.userModel,
    required this.image,
    required this.created,
  });

  factory ReviewCommentModel.fromJson(Map<String, dynamic> json) {
    return ReviewCommentModel(
      id: json["id"],
      image: json["image"],
      comment: json['comment'],
      rating: json["rating"],
      created: DateTime.parse(json['created']),
      userModel: ReviewCommentUserModel.fromJson(json["user"]),
    );
  }

}