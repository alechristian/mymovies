import 'package:get/get.dart';
import 'package:my_movies/pages/favorite_page/favorite_controller.dart';
import 'package:my_movies/pages/home_page/home_controller.dart';
import 'package:my_movies/repositories/movie_repository.dart';

class MyMoviesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<MovieRepository>(() => MovieRepository());
    Get.lazyPut<FavoriteController>(() => FavoriteController(Get.find()));
  }
}
