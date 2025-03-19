part of 'create_review_bloc.dart';

sealed class CreateReviewEvent {}

final class CreateReviewLoad extends CreateReviewEvent {
  final int recipeId;

  CreateReviewLoad({required this.recipeId});
}

final class CreateReviewRate extends CreateReviewEvent {
  final int currentIndex;

  CreateReviewRate({required this.currentIndex});
}

final class CreateReviewPickImage extends CreateReviewEvent {}

final class UpdateApprovalStatus extends CreateReviewEvent {
  final bool isApproved;

  UpdateApprovalStatus({required this.isApproved});
}

final class PostReviewEvent extends CreateReviewEvent {
  final int recipeId;
  final int rating;
  final String comment;
  final File file;

  PostReviewEvent(
      {required this.rating, required this.comment, required this.file, required this.recipeId});

}