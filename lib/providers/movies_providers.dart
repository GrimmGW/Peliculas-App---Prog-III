

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey = 'USEN SU PROPIA API_KEY';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider(){
    print('MoviesProvider esta inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int? page = 1]) async {

    var url = Uri.http(_baseUrl, endpoint, {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '$page'
    });

    final response = await http.get(url);
    return response.body; 

  }

  getOnDisplayMovies() async {
    print('getOnDisplayMovies');

    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();

  }

  getPopularMovies() async{

    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
