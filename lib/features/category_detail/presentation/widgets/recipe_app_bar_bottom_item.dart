import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeAppBarBottomItem extends StatelessWidget {
  const RecipeAppBarBottomItem({
    super.key,
     required this.callback, required this.title, required this.isSelected,
  });
final bool isSelected;
  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected? AppColors.redPinkMain:Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
          onPressed: callback,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.redPinkMain,
              fontFamily: "League Spartan",
              fontSize: 16,
            ),
          )),
    );
  }
}
