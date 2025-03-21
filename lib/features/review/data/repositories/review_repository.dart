import 'dart:io';

import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe_app/features/review/data/models/review_comment_model.dart';
import 'package:recipe_app/features/review/data/repositories/review_repository.dart' as client;

import '../../../review/data/models/review_user_model.dart';

class ReviewsRepository {
  ReviewsRepository({required this.client});

  final ApiClient client;
  Review_user_Model? reviewModel;
  Map<int, List<RecipeModel>> recipesByCategory = {};
  List<ReviewCommentModel> comment=[];


  Future<Review_user_Model> fetchRecipeForReviews(int recipeId) async {
    var rawRecipe = await client.fetchReview(recipeId);
    reviewModel = Review_user_Model.fromJson(rawRecipe);
    return reviewModel!;
  }
  Future<List<ReviewCommentModel>>fetchRecipeCommentReviews(int recipeId )async{
      var rawComment=await client.fetchReviewComment(recipeId);
      comment = rawComment.map((e)=>ReviewCommentModel.fromJson(e)).toList();
      return comment;
    }

  Future<bool> postReviewComment(int recipeId, String comment, int rating, File file) async{
    return client.postReviewComment(recipeId, comment, rating, file);
  }

}



