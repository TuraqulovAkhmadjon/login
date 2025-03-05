import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/recipe_icon_button.dart';

class CategoriesBottomNavBar extends StatelessWidget {
  const CategoriesBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 128,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Container(
              width: 280,
              height: 56,
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                borderRadius: BorderRadius.circular(33),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecipeIconButton(
                    image: "assets/icons/home.svg", callback: () {},),
                  RecipeIconButton(
                    image: "assets/icons/massages.svg", callback: () {},),
                  RecipeIconButton(
                    image: "assets/icons/categories.svg", callback: () {},),
                  RecipeIconButton(
                    image: "assets/icons/profile.svg", callback: () {},)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
