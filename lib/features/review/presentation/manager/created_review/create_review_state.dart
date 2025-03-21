import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:recipe_app/features/review/data/models/reviewComment_user_model.dart';
import 'package:recipe_app/features/review/data/models/review_comment_model.dart';

enum CreateReviewStatus { idle, loading, error }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final bool? doesRecommend;

  final File? pickedImage;
  final ReviewCommentUserModel? recipeModel;

  const CreateReviewState({
    required this.recipeId,
    required this.currentIndex,
    required this.status,
    required this.pickedImage,
    required this.doesRecommend,
    required this.recipeModel,
  });

  factory CreateReviewState.initial() {
    return CreateReviewState(
        recipeId: null,
        currentIndex: null,
        pickedImage: null,
        doesRecommend: null,
        recipeModel: null,
        status: CreateReviewStatus.loading);
  }

  CreateReviewState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewStatus? status,
    File? pickedImage,
    bool? doesRecommend,
    ReviewCommentUserModel? recipeModel,
  }) {
    return CreateReviewState(
      recipeId: recipeId ?? this.recipeId,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      pickedImage: pickedImage ?? this.pickedImage,
      doesRecommend: doesRecommend ?? this.doesRecommend,
      recipeModel: recipeModel ?? this.recipeModel,
    );
  }

  @override
  List<Object?> get props => [recipeId, currentIndex, pickedImage, status];
}
//bo'ldi bu111