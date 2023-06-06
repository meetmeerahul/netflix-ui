class PopularMovies {
  int? page;
  List<PopularMoviesResults>? results;
  int? totalPages;
  int? totalResults;

  PopularMovies({this.page, this.results, this.totalPages, this.totalResults});

  PopularMovies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <PopularMoviesResults>[];
      json['results'].forEach((v) {
        results!.add(new PopularMoviesResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class PopularMoviesResults {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  PopularMoviesResults(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  PopularMoviesResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    //voteAverage = json['vote_average'];
    //voteCount = json['vote_count'];
  }

  static List<PopularMoviesResults> popularFromSnapshot(
      List<dynamic> popularSnapshot) {
    return popularSnapshot
        .map((json) => PopularMoviesResults.fromJson(json))
        .toList();
  }
}
