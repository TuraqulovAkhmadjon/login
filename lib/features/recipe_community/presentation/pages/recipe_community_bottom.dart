import 'package:flutter/material.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_app_bar_bottom_item.dart';
import 'package:recipe_app/features/recipe_community/presentation/manager/recipe_community_view_model.dart';

class RecipeCommunityBottom extends StatefulWidget implements PreferredSizeWidget {
  final RecipeCommunityViewModel vm;

  const RecipeCommunityBottom({super.key, required this.vm});

  @override
  Size get preferredSize => const Size(double.infinity, 25);

  @override
  _RecipeCommunityBottomState createState() => _RecipeCommunityBottomState();
}

class _RecipeCommunityBottomState extends State<RecipeCommunityBottom> {
  List<String> titles = ["Top Recipes", "Newest", "Oldest"];
  int selectedIndex = 0;

  void _sortCommunity(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      widget.vm.community.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (index == 1) {
      widget.vm.community.sort((a, b) => b.created.compareTo(a.created));
    } else if (index == 2) {
      widget.vm.community.sort((a, b) => a.created.compareTo(b.created));
    }

    widget.vm.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < titles.length; i++) ...[
            RecipeAppBarBottomItem(
              callback: () => _sortCommunity(i),
              title: titles[i],
              isSelected: i == selectedIndex,
            ),
            const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}
