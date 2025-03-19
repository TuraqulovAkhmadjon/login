import 'package:recipe_app/features/review/presentation/widgets/review_comment.dart';
import 'package:recipe_app/features/review/presentation/widgets/review_recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipe_app/features/catigories/presentation/widgets/categories_app_bar.dart';

import '../manager/reviews/review_bloc.dart';
import '../manager/reviews/review_state.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Reviews",
        actions: null,
      ),
      body: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          if (state.status == ReviewsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ReviewsStatus.error) {
            return const Center(child: Text("Error loading reviews"));
          } else if (state.status == ReviewsStatus.idle) {
            // Null check
            if (state.reviewModel == null || state.comment == null) {
              return const Center(child: Text("No reviews available"));
            }

            final recipe = state.reviewModel!;
            final comments = state.comment!;

            return Column(
              children: [
                ReviewRecipe(recipe: recipe),
                Expanded(
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) => ReviewComment(
                      comment: comments[index],
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text("Unexpected state"));
        },
      ),
    );
  }
}
