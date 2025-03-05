import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
  });

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            image,
            width: 159,
            height: 145,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
