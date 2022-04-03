// To parse this JSON data, do
//
//     final topRatedClass = topRatedClassFromMap(jsonString);

import 'dart:convert';
import 'package:app_peliculas/models/movie.dart';

class TopRatedClass {
    TopRatedClass({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory TopRatedClass.fromJson(String str) => TopRatedClass.fromMap(json.decode(str));

    factory TopRatedClass.fromMap(Map<String, dynamic> json) => TopRatedClass(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}
