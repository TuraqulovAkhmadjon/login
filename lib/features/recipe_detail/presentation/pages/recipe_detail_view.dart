import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_time.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_bottom_nav_bar.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_image_and_video.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_user_section.dart';

import '../../../category_detail/presentation/widgets/RecipeIconButtonContainer.dart';
import '../../../catigories/presentation/widgets/categories_app_bar.dart';
import '../../data/models/recipe_detail_view_model.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: vm.recipe!.title,
          actions: [
            RecipeIconButtonContainer(
              containerColor: AppColors.redPinkMain,
              image: "assets/icons/heart.svg",
              iconColor: Colors.white,
              iconWidth: 16,
              iconHeight: 15,
              callback: () {},
            ),
            SizedBox(width: 5),
            RecipeIconButtonContainer(
              containerColor: AppColors.redPinkMain,
              image: "assets/icons/ulash.svg",
              iconColor: Colors.white,
              iconWidth: 12,
              iconHeight: 18,
              callback: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    RecipeDetailImageAndVideo(),
                    SizedBox(height: 20),
                    RecipeDetailUserSection(user: vm.recipe!.userModel),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: AppColors.pinkSub,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Details",
                              style: TextStyle(
                                  color: AppColors.redPinkMain,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        RecipeTime(timeRequired: vm.recipe!.timeRequired)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CategoriesBottomNavBar(),
      );
    }
  }
}
