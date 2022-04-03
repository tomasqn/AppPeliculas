
import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:app_peliculas/search/search_delegate.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {


  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final nowPlayingProvider = Provider.of<MoviesProvider>(context);
    final popularProvider = Provider.of<MoviesProvider>(context);
    final topRatedProvider = Provider.of<MoviesProvider>(context);
    final upcomingProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context, 
              delegate: MovieSearchDelegate()
              ), 
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
              title: 'Popular', 
              onNextPage: () => popularProvider.getPopularMovies(),
              ),
              MovieSlider(
              movies: topRatedProvider.topRatedMovies, 
              title: 'Top Rated', 
              onNextPage: () => topRatedProvider.getTopRatedMovies(),
              ),
              MovieSlider(
              movies: upcomingProvider.upcomingMovies, 
              title: 'Upcoming', 
              onNextPage: () => upcomingProvider.getUpcomingMovies(),
              )
          ],
        ),
      )
    );
  }
}