part of 'review_bloc.dart';

 class ReviewsEvent {}

 class ReviewsLoading extends ReviewsEvent {
  final int recipeId;

  ReviewsLoading({required this.recipeId});
}
