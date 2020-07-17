
import 'package:json_annotation/json_annotation.dart';

import 'recipe_info.dart';

part 'recipe_list.g.dart';

@JsonSerializable()
class RecipeList {

  final int offset;
  final int number;
  final int totalResults;
  final List<RecipeInfo> results;

  RecipeList({this.offset, this.number, this.totalResults, this.results});

  factory RecipeList.fromJson(Map<String, dynamic> json) => _$RecipeListFromJson(json);
}