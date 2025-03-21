import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_app_bar.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_bottom_nav_bar.dart';

class TrendingRecipesView extends StatelessWidget {
  const TrendingRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(title: "Trending Recipes"),
      extendBody: true,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 241,
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Most Viewed Today',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 352,
                  height: 185,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 348,
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Salami and cheese pizza",
                                    style: TextStyle(
                                      color: AppColors.beigeColor,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: 80),
                                  SvgPicture.asset(
                                    'assets/icons/hour.svg',
                                  ),
                                  Text(
                                    '30min',
                                    style: TextStyle(
                                      color: AppColors.redPinkMain,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'This is a quick overview of the ingredients...',
                                      style: TextStyle(
                                        color: AppColors.beigeColor,
                                        fontFamily: "League Spartan",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '5',
                                    style:
                                    TextStyle(color: AppColors.redPinkMain),
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/star-filled.svg"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/recipe/burger.png',
                            width: 358,
                            height: 135,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(36, 16, 36, 0),
                  child: Container(
                    width: 358,
                    height: 151,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                          child: Image.asset(
                            "assets/recipe/breakfast.png",
                            width: 140,
                            height: 151,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Chicken Curry',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Savor the aromatic Chicken Curry—a rich blend of spices...',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'By Chef Josh Ryan',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/hour.svg',
                                    ),
                                    Text(
                                      "45 min",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.redPinkMain,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Easy',
                                      style: TextStyle(
                                        color: AppColors.redPinkMain,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SvgPicture.asset('assets/icons/reting.svg'),
                                    SizedBox(width: 15),
                                    Text(
                                      '4',
                                      style: TextStyle(
                                          color: AppColors.redPinkMain),
                                    ),
                                    SvgPicture.asset(
                                        "assets/icons/star-filled.svg"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CategoriesBottomNavBar(),
    );
  }
}
