import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe_app/features/catigories/data/repositories/repository.dart';
import 'package:recipe_app/features/recipe_community/data/repositories/recipe_community_repository.dart';
import 'package:recipe_app/features/recipe_detail/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/review/data/repositories/review_repository.dart';

import '../features/category_detail/data/repositories/recipe_repository.dart';
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => CategoriesRepository(client: context.read()),
  ),
  Provider(
    create: (context) => RecipeRepository(client: context.read()),
  ),
  Provider(
    create: (context) => RecipeDetailRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => RecipeCommunityRepository(client: context.read()),
  ),
  Provider(
    create: (context) => ReviewsRepository(client: context.read()),
  ),
];
