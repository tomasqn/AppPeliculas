
import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {


  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final nowPlayingProvider = Provider.of<MoviesProvider>(context);
    final popularProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en Cine'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search)
            )
        ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: nowPlayingProvider.onDisplayMovies),
            MovieSlider(
              movies: popularProvider.popularMovies, 
              title: 'Populares', 
              onNextPage: () => popularProvider.getPopularMovies(),)
          ],
        ),
      )
    );
  }
}