import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



import '../../../catigories/presentation/widgets/app_bar_circular_container.dart';
import '../../../catigories/presentation/widgets/categories_bottom_nav_bar.dart';
import '../../data/models/recipe_detail_view_model.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key
  , required this.vm,});
final RecipeDetailViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CategoriesBottomNavBar(),
      appBar: AppBar(
        leading: SvgPicture.asset(
          "assets/icons/backarrow.svg",
          width: 30,
          height: 14,
          fit: BoxFit.none,
        ),
        centerTitle: true,
        title: Text(
          "Trending Recipes",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBarCircularContainer(
                  color: Theme.of(context).colorScheme.primary,
                  image: "assets/icons/like.svg",
                ),
                SizedBox(width: 8),
                AppBarCircularContainer(
                  color: Theme.of(context).colorScheme.primary,
                  image: "assets/icons/ulash.svg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
