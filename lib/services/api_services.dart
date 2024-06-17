import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/upcoming_movies_model.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class ApiServices {
  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("Success");
      return UpcomingMoviesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
