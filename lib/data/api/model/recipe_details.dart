import 'package:json_annotation/json_annotation.dart';

part 'recipe_details.g.dart';

@JsonSerializable()
class RecipeDetails {
  final int id;
  final String title;
  final bool vegetarian;
  final int readyInMinutes;
  final String image;
  final String summary;
  final String sourceUrl;

  RecipeDetails({this.id, this.title, this.vegetarian, this.readyInMinutes, this.image, this.summary, this.sourceUrl});

  factory RecipeDetails.fromJson(Map<String, dynamic> json) => _$RecipeDetailsFromJson(json);

}
