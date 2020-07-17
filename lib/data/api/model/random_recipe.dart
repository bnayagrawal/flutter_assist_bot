import 'package:json_annotation/json_annotation.dart';

import 'recipe_details.dart';

part 'random_recipe.g.dart';

@JsonSerializable()
class RandomRecipe {

  final List<RecipeDetails> recipes;

  RandomRecipe({this.recipes});

  factory RandomRecipe.fromJson(Map<String, dynamic> json) => _$RandomRecipeFromJson(json);
}