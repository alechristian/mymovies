class MovieSearchList {
  List<Results>? results;

  MovieSearchList({this.results});

  MovieSearchList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  double? relevance;
  String? type;
  int? id;
  int? year;
  String? resultType;
  String? imdbId;
  int? tmdbId;
  String? tmdbType;
  String? imageUrl;

  Results(
      {this.name,
      this.relevance,
      this.type,
      this.id,
      this.year,
      this.resultType,
      this.imdbId,
      this.tmdbId,
      this.tmdbType,
      this.imageUrl});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    relevance = json['relevance'];
    type = json['type'];
    id = json['id'];
    year = json['year'];
    resultType = json['result_type'];
    imdbId = json['imdb_id'];
    tmdbId = json['tmdb_id'];
    tmdbType = json['tmdb_type'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['relevance'] = relevance;
    data['type'] = type;
    data['id'] = id;
    data['year'] = year;
    data['result_type'] = resultType;
    data['imdb_id'] = imdbId;
    data['tmdb_id'] = tmdbId;
    data['tmdb_type'] = tmdbType;
    data['image_url'] = imageUrl;
    return data;
  }
}
