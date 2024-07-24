class Movie {
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

  Movie({
    this.name,
    this.relevance,
    this.type,
    this.id,
    this.year,
    this.resultType,
    this.imdbId,
    this.tmdbId,
    this.tmdbType,
    this.imageUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['name'],
      relevance: json['relevance'],
      type: json['type'],
      id: json['id'],
      year: json['year'],
      resultType: json['resultType'],
      imdbId: json['imdbId'],
      tmdbId: json['tmdbId'],
      tmdbType: json['tmdbType'],
      imageUrl: json['imageUrl'],
    );
  }
}
