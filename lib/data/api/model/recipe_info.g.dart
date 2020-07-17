// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeInfo _$RecipeInfoFromJson(Map<String, dynamic> json) {
  return RecipeInfo(
    id: json['id'] as int,
    title: json['title'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$RecipeInfoToJson(RecipeInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
