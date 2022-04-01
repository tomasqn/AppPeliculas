import 'dart:async';

import 'package:app_peliculas/helpers/debouncer.dart';
import 'package:app_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = '8fe3b4eefdc4d1f5f5c60babde48b82e';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-EN';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500)
    );

  final StreamController<List<Movie>> _suggestionStreamController = StreamController.broadcast();
  Stream <List<Movie>> get suggestionStream => _suggestionStreamController.stream;

  MoviesProvider(){
    getNowPlayingMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async{
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
      });

    final response = await http.get(url);
    return response.body;
  }

  getNowPlayingMovies() async {

    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingClass.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularClass.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast (int movieId) async{

    if(movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsClass.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies (String query) async {

    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
      'query': query
      });

    try {

      final response = await http.get(url);
      final searchResponse = SearchClass.fromJson(response.body);
      return searchResponse.results;

    } catch (error) {
      print(('ERROR: $error'));
      final List<Movie> list = [];
      return list;
    }
  }

  void getSuggestionsByQuery (String searchTerm){

    debouncer.value = '';
    debouncer.onValue = (value) async{
      final results = await searchMovies(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
     });

     Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }

}