import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/presentation/pages/category_detail_view.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_app_bar.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_bottom_nav_bar.dart';
import 'package:recipe_app/features/recipe_community/presentation/manager/recipe_community_view_model.dart';
import 'package:recipe_app/features/recipe_community/presentation/pages/recipe_community_bottom.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_view.dart';

import '../../../../core/client.dart';
import '../../../category_detail/data/repositories/recipe_repository.dart';
import '../../../category_detail/presentation/manager/category_detail_view_model.dart';
import '../../../category_detail/presentation/widgets/RecipeIconButtonContainer.dart';

class RecipeCommunityView extends StatelessWidget {
  const RecipeCommunityView({
    super.key,
  });

  String getTimeAgo(DateTime created) {
    final Duration difference = DateTime.now().difference(created);
    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} second ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minute ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hour ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} day ago";
    } else {
      return DateFormat('yyyy-MM-dd').format(created);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeCommunityViewModel>();
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Community",
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 42),
          child: RecipeCommunityBottom(),
        ),
      ),
      body: ListView.builder(
        itemCount: vm.filteredRecipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        vm.filteredRecipes[index].userModel.profilePhoto,
                        height: 42,
                        width: 42,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@${vm.filteredRecipes[index].userModel.username}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          getTimeAgo(vm.filteredRecipes[index].created),
                          style: TextStyle(
                              color: AppColors.redPinkMain, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailView(
                          vm: CategoryDetailViewModel(
                            catRepo: context.read(),
                            recipeRepo: RecipeRepository(client: ApiClient()),
                          )..load(),
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          vm.filteredRecipes[index].photo,
                          height: 250,
                          width: 356,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 8,
                        child: RecipeIconButtonContainer(
                          containerColor: AppColors.redPinkMain,
                          image: "assets/icons/heart.svg",
                          iconColor: Colors.white,
                          callback: () {},
                          iconWidth: 16,
                          iconHeight: 15,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.redPinkMain,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    vm.filteredRecipes[index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    vm.filteredRecipes[index].rating.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      vm.filteredRecipes[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "League Spartan",
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/icons/hour.svg"),
                                          SizedBox(width: 3),
                                          Text(
                                            '${vm.filteredRecipes[index].timeRequired}min',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Text(
                                            vm.filteredRecipes[index]
                                                .reviewsCount
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(width: 3),
                                          SvgPicture.asset(
                                            "assets/icons/fikrlar.svg",
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.pinkSub,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CategoriesBottomNavBar(),
    );
  }
}
