import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/app_bar_circular_container.dart';
import 'package:recipe_app/features/recipe_home/presentation/manager/recipe_home_view_model.dart';

class RecipeHomeView extends StatelessWidget {
  const RecipeHomeView({
    super.key,
    required this.vm,
  });

  final RecipeHomeViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! Dianne",
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppBarCircularContainer(image: "assets/icons/notification.svg"),
                SizedBox(width: 8),
                AppBarCircularContainer(image: "assets/icons/search.svg"),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),
                if (vm.categories.isNotEmpty)
                  ...vm.categories.map(
                    (category) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 25,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.redPinkMain,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text(
                            category.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
