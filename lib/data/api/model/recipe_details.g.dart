// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetails _$RecipeDetailsFromJson(Map<String, dynamic> json) {
  return RecipeDetails(
    id: json['id'] as int,
    title: json['title'] as String,
    vegetarian: json['vegetarian'] as bool,
    readyInMinutes: json['readyInMinutes'] as int,
    image: json['image'] as String,
    summary: json['summary'] as String,
    sourceUrl: json['sourceUrl'] as String,
  );
}

Map<String, dynamic> _$RecipeDetailsToJson(RecipeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vegetarian': instance.vegetarian,
      'readyInMinutes': instance.readyInMinutes,
      'image': instance.image,
      'summary': instance.summary,
      'sourceUrl': instance.sourceUrl,
    };
