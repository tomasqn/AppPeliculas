import 'package:app_peliculas/models/models.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie),
              _Overview(movie: movie),
              const SizedBox(height: 5,),
              CastingCards(movieId: movie.id)
              ]
              )
            )
        ],
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({ Key? key, required this.movie }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepOrange,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(movie.title, style: const TextStyle(fontSize: 16 )),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover
          ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  const _PosterAndTitle({ Key? key, required this.movie }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg', ), 
                image: NetworkImage(movie.fullPosterPath),
                height: 150,
                width: 100,
                fit: BoxFit.contain,
                )
            ),
          ),

          const SizedBox(width: 20,),

          SizedBox(
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2, ),
                Text('Release: ${movie.releaseDate!}', style: textTheme.subtitle2, overflow: TextOverflow.ellipsis, maxLines: 1,),
                Text(movie.originalTitle, style: textTheme.subtitle2, overflow: TextOverflow.ellipsis, maxLines: 2,),
          
                Row(
                  children: [
                    const Icon(Icons.star_border_outlined, size: 15, color: Colors.yellow,),
                    const SizedBox(width: 5),
                    Text('${movie.voteAverage}', style: textTheme.caption,)
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}


class _Overview extends StatelessWidget {
  const _Overview({ Key? key, required this.movie }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
        )
    );
  }
}