import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/Repository/Api/api_client.dart';

import '../../Model_CLass/MovieModel.dart';

class MovieApi {
  ApiClient apiClient = ApiClient();

  Future<MovieModel> getMovie() async {
    String path = 'https://movies-api14.p.rapidapi.com/shows';
    var body = {};
    Response response = await apiClient.invokeAPI(path, 'GET', body);
    return MovieModel.fromJson(jsonDecode(response.body));
  }
}
