// To parse this JSON data, do
//
//     final nowPlayingClass = nowPlayingClassFromMap(jsonString);

import 'dart:convert';
import 'package:app_peliculas/models/models.dart';

class NowPlayingClass {

    NowPlayingClass({
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

    factory NowPlayingClass.fromJson(String str) => NowPlayingClass.fromMap(json.decode(str));

    factory NowPlayingClass.fromMap(Map<String, dynamic> json) => NowPlayingClass(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    // Post Request
    // Map<String, dynamic> toMap() => {
    //     "dates": dates.toMap(),
    //     "page": page,
    //     "results": List<dynamic>.from(results.map((x) => x.toMap())),
    //     "total_pages": totalPages,
    //     "total_results": totalResults,
    // };
}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    // Map<String, dynamic> toMap() => {
    //     "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    //     "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    // };
}

