import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_item/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:recipe_app/features/category_detail/presentation/widgets/recipe_app_bar_bottom.dart';
import 'package:recipe_app/features/catigories/presentation/widgets/categories_app_bar.dart';

import '../../../catigories/presentation/widgets/categories_bottom_nav_bar.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key, required this.vm});

  final CategoryDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) {
        if (vm.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            extendBody: true,
            appBar: RecipeAppBar(
              title: vm.selected.title,
              bottom: RecipeAppBarBottom(vm: vm),
            ),
            body: GridView.builder(
                padding: EdgeInsets.fromLTRB(16, 36, 16, 120),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 226,
                    mainAxisSpacing: 30,
                ),
                itemCount: vm.recipes.length,
                itemBuilder: (context, index) => RecipeItem(recipe: vm.recipes[index])),
            bottomNavigationBar: CategoriesBottomNavBar(),
          );
        }
      },
    );
  }
}
