import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/review/data/models/review_comment_model.dart';

import '../../../data/models/review_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final ReviewModel? reviewModel;
  final List<ReviewCommentModel>? comment;

  const ReviewsState({
    required this.reviewModel,
    required this.status,
    required this.comment,
  });

  ReviewsState copyWith({
    ReviewModel? recipeModel,
   List <ReviewCommentModel>? comment,
    ReviewsStatus? status,
  }) {
    return ReviewsState(
      reviewModel: recipeModel ?? this.reviewModel,
      comment: comment ?? this.comment,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [reviewModel, status,comment];
}
