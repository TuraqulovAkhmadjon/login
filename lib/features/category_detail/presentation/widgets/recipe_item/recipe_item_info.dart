import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_model.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_item/recipe_item_desription.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_item/recipe_item_title.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_rating.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_time.dart';

class RecipeItemInfo extends StatelessWidget {
  const RecipeItemInfo({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.5,
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
        border: Border.all(
          color: AppColors.pinkSub,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeItemTitle(recipe: recipe),
          SizedBox(
            height: 7,
          ),
          RecipeItemDesription(recipe: recipe),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecipeRating(rating: recipe.rating),
              RecipeTime(timeRequired: recipe.timeRequired)
            ],
          )
        ],
      ),
    );
  }
}
