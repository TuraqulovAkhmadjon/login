import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainCategoriesItem extends StatelessWidget {
  const MainCategoriesItem({
    super.key,
    required this.image,
    required this.title,
  });

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            image,
            width: 356,
            height: 146,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
