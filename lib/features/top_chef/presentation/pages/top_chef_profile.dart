

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_bottom_nav_bar.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/recipe_elevated_button.dart';
import '../../../category_detail/presentation/widgets/RecipeIconButtonContainer.dart';
import '../../../catigories/presentation/widgets/categories_app_bar.dart';
import '../widgets/favorites_item.dart';
import '../widgets/following.dart';


class TopChefProfileView extends StatelessWidget {
  const TopChefProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        title: "@Neil_tran",
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/ulash.svg",
            callback: () {},
            iconWidth: 15.w,
            iconHeight: 16.h,
          ),
          SizedBox(width: 5.w),
          RecipeIconButtonContainer(
            image: "assets/icons/three_dots.svg",
            callback: () {},
            iconWidth: 4.w,
            iconHeight: 16.h,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 200.h),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/recipe/breakfast.png",
                      width: 102.w,
                      height: 97.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 24.h,
                        child: Text(
                          "Neil Tran-Chef",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.redPinkMain,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200.w,
                        height: 37.h,
                        child: Text(
                          "Passionate chef in creative and contemporary cuisine.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      RecipeElevatedButton(
                        text: "Following", callback: () {  },

                      ),
                    ],
                  ),
                ],
              ),
              Following(),
              Column(
                children: [
                  Text("Recipes"),
                  Divider(color: AppColors.redPinkMain),
                ],
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 1.h),
        children: [
          FavoritesItem(title: "Vegan Recipes", image: "assets/recipe/vegan.png"),
          SizedBox(height: 55.h),
          FavoritesItem(title: "Asian Heritage", image: "assets/recipe/pizza.png"),
          SizedBox(height: 55.h),
          FavoritesItem(title: "Guilty Pleasures", image: "assets/recipe/dinner.png"),
        ],
      ),
      bottomNavigationBar: CategoriesBottomNavBar(),
    );
  }
}
