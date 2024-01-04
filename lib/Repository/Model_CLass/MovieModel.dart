class MovieModel {
  MovieModel({
      this.movies, 
      this.page,});

  MovieModel.fromJson(dynamic json) {
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
    page = json['page'];
  }
  List<Movies>? movies;
  int? page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    map['page'] = page;
    return map;
  }

}

class Movies {
  Movies({
      this.id, 
      this.backdropPath, 
      this.firstAired, 
      this.genres, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.title, 
      this.contentType,});

  Movies.fromJson(dynamic json) {
    id = json['_id'];
    backdropPath = json['backdrop_path'];
    firstAired = json['first_aired'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    title = json['title'];
    contentType = json['contentType'];
  }
  int? id;
  String? backdropPath;
  String? firstAired;
  List<String>? genres;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;
  String? contentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['backdrop_path'] = backdropPath;
    map['first_aired'] = firstAired;
    map['genres'] = genres;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['title'] = title;
    map['contentType'] = contentType;
    return map;
  }

}