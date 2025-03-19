import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeTextButtonContainer extends StatelessWidget {
  const RecipeTextButtonContainer({
    super.key,
    required this.text,
    required this.callback,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.containerWidth,
    this.containerHeight = 22,
    this.fontColor = AppColors.pinkSub,
    this.containerColor = AppColors.pink,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double? containerWidth, containerHeight;
  final Color fontColor, containerColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: containerWidth,
      height: containerHeight,
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(
          backgroundColor: containerColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
