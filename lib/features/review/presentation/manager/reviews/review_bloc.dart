import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/review/presentation/manager/reviews/review_state.dart';

import '../../../data/repositories/review_repository.dart';

part 'review_events.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc({
    required ReviewsRepository recipeRepo,
    required int recipeId,
  })  : _recipeRepo = recipeRepo,
        super(ReviewsState(
          reviewModel: null,
          comment: null,
          status: ReviewsStatus.loading,
        )) {
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId));
  }

  final ReviewsRepository _recipeRepo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchRecipeForReviews(event.recipeId);
    final comment = await _recipeRepo.fetchRecipeCommentReviews(event.recipeId);
    emit(state.copyWith(recipeModel: recipe, status: ReviewsStatus.idle));
    emit(state.copyWith(comment: comment, status: ReviewsStatus.idle));
  }
}
