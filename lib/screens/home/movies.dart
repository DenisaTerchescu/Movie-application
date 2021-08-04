
import 'package:flutter/material.dart';

class Movie
{
  Movie (Map<String, dynamic> movie)
      : title=movie['title'] as String,
        image=movie['medium_cover_image'] as String,
        year=movie['year'] as int,
        rating=(movie['rating'] as num).toDouble(),
        summary=movie['summary'] as String;

  final String title;
  final String image;
  final int year;
  final double rating;
  final String summary;

  String get movieTitle
  {
    return '$title ($year) - $rating';
  }
}