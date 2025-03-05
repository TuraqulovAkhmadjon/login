import 'package:flutter/material.dart';
import 'package:recipe_app/features/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_app_bar_bottom_item.dart';

class RecipeAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarBottom({
    super.key,
    required this.vm,
  });

  final CategoryDetailViewModel vm;

  @override
  Size get preferredSize => const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          for (var category in vm.categories)
            RecipeAppBarBottomItem(
              title: category.title,
              callback: () => vm.selected = category,
              isSelected: category.id == vm.selected.id,
            ),
        ],
      ),
    );
  }
}
