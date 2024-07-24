import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/constants/colors.dart';
import 'package:my_movies/pages/home_page/home_controller.dart';

class HomeView extends StatelessWidget {
  final TextEditingController searchText = TextEditingController();
  final controller = Get.find<HomeController>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/favorites');
                controller.loadFavorites();
              },
              child: const Row(
                children: [
                  Text('Favoritos'),
                  SizedBox(width: 8),
                  Icon(Icons.favorite),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchText,
              decoration: const InputDecoration(
                labelText: 'Digite o nome do filme',
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: ElevatedButton(
                child: const Text('Buscar'),
                onPressed: () {
                  controller.getMovieData(searchText.text);
                },
              ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : controller.listMovies.value != null
                      ? Obx(
                          () => Expanded(
                            child: ListView.builder(
                              itemCount:
                                  controller.listMovies.value!.results!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller
                                      .listMovies.value!.results![index].name!),
                                  subtitle: Text(controller
                                      .listMovies.value!.results![index].type!),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.favorite,
                                        color:AppColors.grey),
                                    onPressed: () {
                                      controller.addToFavorites(controller
                                          .listMovies.value!.results![index]);
                                      controller.saveMomentIdenx(index);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('Nenhum Filme encontrado'),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
