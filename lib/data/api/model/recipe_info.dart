
import 'package:json_annotation/json_annotation.dart';

part 'recipe_info.g.dart';

@JsonSerializable()
class RecipeInfo {
  final int id;
  final String title;
  final String image;

  RecipeInfo({this.id, this.title, this.image});

  factory RecipeInfo.fromJson(Map<String, dynamic> json) => _$RecipeInfoFromJson(json);

}