
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class RecipeDetailImage extends StatelessWidget {
  const RecipeDetailImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: image,
        width: 357,
        height: 281,
        fit: BoxFit.cover,
      ),
    );
  }
}
