import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_app_bar_bottom_item.dart';
import 'package:recipe_app/features/recipe_community/presentation/manager/recipe_community_view_model.dart';

class RecipeCommunityBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeCommunityBottom({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 25);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeCommunityViewModel>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < 3; i++) ...[
            RecipeAppBarBottomItem(
              callback: () => vm.updateTabIndex(i),
              title: ["Top Recipes", "Newest", "Oldest"][i],
              isSelected: i == vm.selectedTabIndex,
            ),
            const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}
