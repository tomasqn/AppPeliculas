// To parse this JSON data, do
//
//     final searchClass = searchClassFromMap(jsonString);

import 'dart:convert';
import 'package:app_peliculas/models/models.dart';

class SearchClass {
    SearchClass({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int? page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory SearchClass.fromJson(String str) => SearchClass.fromMap(json.decode(str));

    factory SearchClass.fromMap(Map<String, dynamic> json) => SearchClass(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}