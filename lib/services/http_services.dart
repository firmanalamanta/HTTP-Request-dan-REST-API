import 'package:http/http.dart' as http;
import 'package:http_request_rest_api/model/movie.dart';
import 'dart:io';
import 'dart:convert';

class HttpService {
  final String apiKey = 'isi dengan api key anda';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/550?api_key=74b9e605a41e9ff14df93e16cc7f767e';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      final jsonResponce = json.decode(result.body);
      final moviesMap =  jsonResponce['results'];
      List  movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("fail");
      return null;
      
    }
  }
}