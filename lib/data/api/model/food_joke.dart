import 'package:json_annotation/json_annotation.dart';

part 'food_joke.g.dart';

@JsonSerializable()
class FoodJoke {

  @JsonKey(name: 'text')
  final String joke;

  factory FoodJoke.fromJson(Map<String, dynamic> json) => _$FoodJokeFromJson(json);

  FoodJoke({this.joke});
}