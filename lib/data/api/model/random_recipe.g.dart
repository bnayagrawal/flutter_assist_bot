// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomRecipe _$RandomRecipeFromJson(Map<String, dynamic> json) {
  return RandomRecipe(
    recipes: (json['recipes'] as List)
        ?.map((e) => e == null
            ? null
            : RecipeDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RandomRecipeToJson(RandomRecipe instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };
