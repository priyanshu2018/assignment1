import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Post {
  final Title;

  final  Rated;
  final  Released;
  final  Runtime;
  final  Genre;
  final  Director;
  final  Writer;
  final  Actors;
  final  Plot;
  final  Language;
  final  Country;
  final  Awards;
  final  Poster;
  final imdbRating;
  final Type;

  Post({this.Title,this.Rated,this.Released,this.Runtime,this.Genre,this.Director,this.Writer,this.Actors,this.Plot,this.Language,this.Country,this.Awards,this.Poster,this.imdbRating,this.Type});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

        Title: json['Title'],
      Rated : json['Rated'],
      Released : json['Released'],
      Runtime: json['Runtime'],
     Genre: json['Genre'],
      Director: json['Director'],
      Writer: json['Writer'],
      Actors: json['Actors'],
      Plot: json['Plot'],
      Language: json['Language'],
      Country: json['Country'],
      Awards : json['Awards'],
      Poster : json['Poster'],
        imdbRating : json['imdbRating'],
        Type : json['Type']
    );
  }
}

Future<Post> fetchPost( String url ) async {
  final response =  await http.get('http://www.omdbapi.com/?t=${url}&apikey=d8970c8d');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}