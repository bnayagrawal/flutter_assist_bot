import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/model.dart';

class SpoonacularApiClient {
  SpoonacularApiClient._privateConstructor();

  static final SpoonacularApiClient _instance = SpoonacularApiClient._privateConstructor();

  factory SpoonacularApiClient() {
    return _instance;
  }

  // API Key
  static const String _api_key = 'YOUR_API_KEY_HERE';

  // API Base url
  static const String _base_api_url = 'api.spoonacular.com';

  // Endpoints

  // Recipe search endpoint
  static const String _recipe_search = '/recipes/complexSearch';

  // Random recipe endpoint
  static const String _random_recipe = '/recipes/random';

  // Random food joke endpoint
  static const String _food_joke = '/food/jokes/random';

  /// Search recipe by type. For ex. Breakfast, side dish, dessert etc.
  /// Returns a list of recipe (id, name, and image)
  Future<RecipeList> getRecipeByType(String type) async {
    final Map<String, String> queryParams = {
      'apiKey': _api_key,
      'type': type,
    };
    final Uri uri = Uri.https(_base_api_url, _recipe_search, queryParams);
    final http.Response response = await http.get(uri);
    // If response is not ok
    _checkResponse(response);
    // Deserialize
    try {
      return RecipeList.fromJson(json.decode(response.body));
    } on Exception {
      throw 'Something went wrong!';
    }
  }

  /// Search recipe by cuisine. For ex. Italian, mexican etc.
  /// Returns a list of recipe (id, name, and image)
  Future<RecipeList> getRecipeByCuisine(String cuisine) async {
    final Map<String, String> queryParams = {
      'apiKey': _api_key,
      'cuisine': cuisine,
    };
    final Uri uri = Uri.https(_base_api_url, _recipe_search, queryParams);
    final http.Response response = await http.get(uri);
    // If response is not ok
    _checkResponse(response);
    // Deserialize
    try {
      return RecipeList.fromJson(json.decode(response.body));
    } on Exception {
      throw 'Something went wrong!';
    }
  }

  /// Returns one random recipe details
  Future<RandomRecipe> getRandomRecipe() async {
    final Map<String, String> queryParams = {'apiKey': _api_key};
    final Uri uri = Uri.https(_base_api_url, _random_recipe, queryParams);
    final http.Response response = await http.get(uri);
    // If response is not ok
    _checkResponse(response);
    // Deserialize
    try {
      return RandomRecipe.fromJson(json.decode(response.body));
    } on Exception {
      throw 'Something went wrong!';
    }
  }

  // The endpoint of this needs to constructed
  // Schema: https://api.spoonacular.com/recipes/{id}/information

  /// Return details of a recipe by id
  Future<RecipeDetails> getRecipeDetails(String recipeId) async {
    final Map<String, String> queryParams = {'apiKey': _api_key};
    final Uri uri = Uri.https(_base_api_url, '/recipes/${recipeId.toString()}/information', queryParams);
    final http.Response response = await http.get(uri);
    // If response is not ok
    _checkResponse(response);
    // Deserialize
    try {
      return RecipeDetails.fromJson(json.decode(response.body));
    } on Exception {
      throw 'Something went wrong!';
    }
  }

  /// Returns a random food joke
  Future<FoodJoke> getFoodJoke() async {
    final Map<String, String> queryParams = {'apiKey': _api_key};
    final Uri uri = Uri.https(_base_api_url, _food_joke, queryParams);
    final http.Response response = await http.get(uri);
    // If response is not ok
    _checkResponse(response);
    // Deserialize
    try {
      return FoodJoke.fromJson(json.decode(response.body));
    } on Exception {
      throw 'Something went wrong!';
    }
  }

  _checkResponse(http.Response response) {
    if (response.statusCode != 200) {
      // Try to build api_error object
      try {
        final ApiError apiError = ApiError.fromJson(json.decode(response.body));
        throw apiError;
      } on Exception catch (e) {
        // Rethrow
        if (e is ApiError)
          throw e;
        else // Deserialization error
          throw Exception(response.body);
      }
    }
  }
}
