import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/components/details_movies_dialog.dart';
import 'package:my_movies/models/movie_details_model.dart';
import 'package:my_movies/models/movie_search_list_model.dart';
import 'package:my_movies/repositories/movie_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final MovieRepository repository;
  final favorites = <Results>[].obs;
  // final listMovies = <Movie>[].obs;
  Rx<MovieSearchList?> listMovies = Rx<MovieSearchList?>(null);
  // Rx<MovieDetails?> detailsMovie = Rx<MovieDetails?>(null);
  RxList<int> selectedMomentIndex = <int>[].obs;

  int selectedIndex = 0;
  var isLoading = false.obs;

  HomeController(this.repository);

  // realiza a busca dos filmes com base no nome
  Future<void> getMovieData(String nameMovie) async {
    try {
      isLoading(true);
      final response = await repository.getMovieData(nameMovie);
      listMovies.value = response;
      update();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
    update();
  }

  // // realiza a busca dos detalhes do filme com base no id
  // Future<void> getDetailsMovie(String id) async {
  //   try {
  //     final response = await repository.getDetailsMovie(id);
  //     detailsMovie.value = response;
  //     update();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   update();
  // }

  // abre o dialog com os detalhes do filme - logo após a busca dos detalhes
  // void openDialogDetails(String id) {
  //   isLoading(true);
  //   getDetailsMovie(id).whenComplete(() {
  //     Get.dialog(
  //       MovieDialog(
  //         title: detailsMovie.value!.title.toString(),
  //         year: detailsMovie.value!.year.toString(),
  //         description: detailsMovie.value!.plotOverview.toString(),
  //         score: detailsMovie.value!.userRating.toString(),
  //         whereToWatch: detailsMovie.value!.networkNames.toString(),
  //       ),
  //     );
  //     isLoading(false);
  //   });
  // }

  // adiciona o filme aos favoritos
  void addToFavorites(Results movie) {
    favorites.add(movie);
    saveFavorites();
    Get.snackbar('Filme salvo', '${movie.name}` foi salvo nos favoritos',
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green);
  }

  // carrega os filmes favoritos
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final favoritesList = jsonDecode(favoritesJson) as List;
      favorites.value =
          favoritesList.map((item) => Results.fromJson(item)).toList();
    }
  }

  // salva os filmes favoritos
  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIdsJson = jsonEncode(favorites);
    prefs.setString('favorites', favoriteIdsJson);
  }

  // salva o index do filme selecionado
  void saveMomentIdenx(int index) {
    selectedMomentIndex.add(index);
    update();
  }
}
