import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/constants/colors.dart';
import 'package:my_movies/pages/favorite_page/favorite_controller.dart';
import 'package:my_movies/pages/home_page/home_controller.dart';

class FavoritesView extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final controller = Get.find<FavoriteController>();

  FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/');
          },
        ),
        title: const Text('Favoritos'),
      ),
      body: Column(
        children: [
          const Text(
            'Selecione um dos filmes para obter informações',
            style: TextStyle(
                color: AppColors.primaryRed, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Obx(() {
            if (homeController.favorites.isEmpty) {
              return const Center(
                child: Text('Nenhum filme favorito'),
              );
            }
            return controller.isLoading.isTrue
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 600,
                    child: GridView.builder(
                      itemCount: homeController.favorites.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        var movie = homeController.favorites[index];
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              controller.openDialogDetails(movie.id.toString());
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 230,
                                    child: Image.network(
                                      movie.imageUrl.toString(),
                                      fit: BoxFit.cover,
                                    )),
                                const SizedBox(height: 8),
                                Text(
                                  movie.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
