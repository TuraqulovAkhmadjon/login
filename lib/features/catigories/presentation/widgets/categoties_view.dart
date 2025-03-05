import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/sizes.dart';
import '../../data/models/categories_view_model.dart';
import 'categories_app_bar.dart';
import 'categories_bottom_nav_bar.dart';
import 'category_item.dart';
import 'main_categories_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.vm});

  final CategoriesViewModel vm;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: vm,
      builder: (context, _) {
        return Scaffold(
          bottomNavigationBar:  CategoriesBottomNavBar(),
          appBar:  RecipeAppBar(title: "Categories"),
          extendBody: true,
          body: CategoriesBody(viewModel: vm),
        );
      },
    );
  }
}

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({
    super.key,
    required this.viewModel,
  });

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return ListView(
          padding:EdgeInsets.only(left:36,right: 36),
          children: [
            if (viewModel.mainCategories != null)
              MainCategoriesItem(
                title: viewModel.mainCategories?.title ?? '',
                image: viewModel.mainCategories?.image ?? '',
              ),
             SizedBox(height: 20),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 120),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 176,
                mainAxisSpacing: 10,
                crossAxisSpacing: 39,
                childAspectRatio: 178/60
              ),
              itemCount: viewModel.categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  image: viewModel.categories[index].image,
                  title: viewModel.categories[index].title,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
