// To parse this JSON data, do
//
//     final upcomingClass = upcomingClassFromMap(jsonString);

import 'dart:convert';

import 'package:app_peliculas/models/models.dart';
import 'package:app_peliculas/models/movie.dart';

class UpcomingClass {
    UpcomingClass({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory UpcomingClass.fromJson(String str) => UpcomingClass.fromMap(json.decode(str));

    factory UpcomingClass.fromMap(Map<String, dynamic> json) => UpcomingClass(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}