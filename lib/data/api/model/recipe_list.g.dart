// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeList _$RecipeListFromJson(Map<String, dynamic> json) {
  return RecipeList(
    offset: json['offset'] as int,
    number: json['number'] as int,
    totalResults: json['totalResults'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : RecipeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecipeListToJson(RecipeList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'number': instance.number,
      'totalResults': instance.totalResults,
      'results': instance.results,
    };
