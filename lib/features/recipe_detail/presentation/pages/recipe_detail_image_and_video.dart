import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_image.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_title_and_stats.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_video.dart';

import '../../../../core/utils/colors.dart';
import '../../../category_detail/presentation/widgets/RecipeIconButtonContainer.dart';
import '../../data/models/recipe_detail_view_model.dart';

class RecipeDetailImageAndVideo extends StatelessWidget {
  const RecipeDetailImageAndVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = context.select((RecipeDetailViewModel vm) => vm.recipe);
    return Center(
      child: SizedBox(
        width: 357,
        
        height: 337,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            RecipeDetailTitleAndStats(
              title: recipe!.title,
              rating: recipe.rating,
              reviews: 2273,
            ),
            RecipeDetailImage(image: recipe.photo),
            Positioned(
              top: 100,
              child: RecipeIconButtonContainer(
                image: "assets/icons/play.svg",
                callback: () =>
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailVideo(
                              videoUrl: recipe.videoRecipe,
                            ),
                      ),
                    ),
                iconWidth: 30,
                iconHeight: 40,
                containerWidth: 74,
                containerHeight: 74,
                containerColor: AppColors.redPinkMain,
                iconColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
