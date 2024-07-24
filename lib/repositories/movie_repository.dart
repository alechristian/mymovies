import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_movies/models/movie_details_model.dart';
import 'package:my_movies/models/movie_search_list_model.dart';

class MovieRepository {
  Dio dio = Dio();
  var API_KEY = dotenv.env['API_KEY'];

  Future<MovieSearchList> getMovieData(String name) async {
    final response = await dio.get(
        'https://api.watchmode.com/v1/autocomplete-search/?apiKey=$API_KEY&search_value=$name&search_type=1');

    if (response.statusCode == 200) {
      final retorno = MovieSearchList.fromJson(response.data);
      return retorno;
    } else {
      throw Exception('Failed to load movie data');
    }
  }

  Future<MovieDetails> getDetailsMovie(String id) async {
    final response = await dio.get(
        'https://api.watchmode.com/v1/title/$id/details/?apiKey=$API_KEY');

    if (response.statusCode == 200) {
      final retorno = MovieDetails.fromJson(response.data);
      return retorno;
    } else {
      throw Exception('Failed to load movie data');
    }
  }
}
