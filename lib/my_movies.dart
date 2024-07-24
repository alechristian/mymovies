import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/bindings.dart';
import 'package:my_movies/pages/favorite_page/favorite_view.dart';

import 'pages/home_page/home_view.dart';

class MyMovies extends StatelessWidget {
  const MyMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyMoviesBindings(),
      title: 'My Movies',
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      ),
      locale: const Locale('pt', 'BR'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeView(),
        ),
        GetPage(
            name: '/favorites',
            page: () => FavoritesView(),
            binding: MyMoviesBindings(), 
            ),
      ],
    );
  }
}
