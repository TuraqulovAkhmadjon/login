import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeIconButton extends StatelessWidget {
  const RecipeIconButton({
    super.key,
    required this.image,
    required this.callback,
    this.size= const Size(28,28)
  });

  final String image;
  final VoidCallback callback;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: IconButton(
        onPressed: callback,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(image),
      ),
    );
  }
}
