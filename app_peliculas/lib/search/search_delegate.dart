import 'package:app_peliculas/models/models.dart';
import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{

  // Con estta linea se puede cambiar lo que dice el search bar
  // @override
  // String? get searchFieldLabel => 'Buscar Película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        onPressed: () => query = '', 
        icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        }, 
      icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      return const Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 100,)
        );
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);
    
    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {

        if(!snapshot.hasData){
          return const Center(
            child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 100,)
            );
        }

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, int index) => _MovieItem(movies[index])
          ) ;
      },
    );

  }
}

class _MovieItem extends StatelessWidget {

  const _MovieItem(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${movie.genreIds}-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage(movie.fullPosterPath),
            width: 50,
            fit: BoxFit.contain,
            ),
        ),
      ),
        title: Text(movie.title),
        subtitle: Text(movie.originalTitle),
        onTap: () => Navigator.pushNamed(context, 'details', arguments: movie)
    );
  }
}