import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/auth/data/models/user_model.dart';
import 'package:recipe_app/features/recipe_detail/data/models/recipe_detail_user_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_text_button_container.dart';

import '../../data/models/recipe_detail_view_model.dart';

class RecipeDetailUserSection extends StatelessWidget {
  const RecipeDetailUserSection({
    super.key,
    required this.user,
  });

  final RecipeDetailUserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: CachedNetworkImage(
            imageUrl: user.profilePhoto,
            width: 62,
            height: 62,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                '@${user.username}',
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                '${user.firstname} ${user.lastname}',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "League Spartan",
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
        RecipeTextButtonContainer(
          text: "Following",
          callback: () {},
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          "assets/icons/three_dots.svg",
          colorFilter: ColorFilter.mode(
            AppColors.redPinkMain,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
