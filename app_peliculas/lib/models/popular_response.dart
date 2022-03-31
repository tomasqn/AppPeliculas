// To parse this JSON data, do
//
//     final popularClass = popularClassFromMap(jsonString);

import 'dart:convert';
import 'package:app_peliculas/models/models.dart';

class PopularClass {
    PopularClass({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory PopularClass.fromJson(String str) => PopularClass.fromMap(json.decode(str));

    factory PopularClass.fromMap(Map<String, dynamic> json) => PopularClass(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    // Map<String, dynamic> toMap() => {
    //     "page": page,
    //     "results": List<dynamic>.from(results.map((x) => x.toMap())),
    //     "total_pages": totalPages,
    //     "total_results": totalResults,
    // };
}
