import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarCircularContainer extends StatelessWidget {
  const AppBarCircularContainer({
    super.key,
    required this.image,
    this.color,
  });

  final String image;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          image,
          width: 15,
          fit: BoxFit.cover
        ),
      ),
    );
  }
}
