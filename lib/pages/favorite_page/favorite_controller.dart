import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_movies/components/details_movies_dialog.dart';
import 'package:my_movies/models/movie_details_model.dart';
import 'package:my_movies/repositories/movie_repository.dart';

class FavoriteController extends GetxController {

  var isLoading = false.obs;

  Rx<MovieDetails?> detailsMovie = Rx<MovieDetails?>(null);

  final MovieRepository repository;

  FavoriteController(this.repository);
  

  // realiza a busca dos detalhes do filme com base no id
  Future<void> getDetailsMovie(String id) async {
    try {
      final response = await repository.getDetailsMovie(id);
      detailsMovie.value = response;
      update();
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  // abre o dialog com os detalhes do filme - logo após a busca dos detalhes
  void openDialogDetails(String id) {
    isLoading(true);
    getDetailsMovie(id).whenComplete(() {
      Get.dialog(
        MovieDialog(
          title: detailsMovie.value!.title.toString(),
          year: detailsMovie.value!.year.toString(),
          description: detailsMovie.value!.plotOverview.toString(),
          score: detailsMovie.value!.userRating.toString(),
          whereToWatch: detailsMovie.value!.networkNames.toString(),
        ),
      );
      isLoading(false);
    });
  }
  
}