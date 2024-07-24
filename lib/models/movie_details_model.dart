class MovieDetails {
  int? id;
  String? title;
  String? originalTitle;
  String? plotOverview;
  String? type;
  int? runtimeMinutes;
  int? year;
  int? endYear;
  String? releaseDate;
  String? imdbId;
  int? tmdbId;
  String? tmdbType;
  List<int>? genres;
  List<String>? genreNames;
  double? userRating;
  int? criticScore;
  String? usRating;
  String? poster;
  String? backdrop;
  String? originalLanguage;
  List<int>? similarTitles;
  List<int>? networks;
  List<String>? networkNames;
  String? trailer;
  String? trailerThumbnail;
  double? relevancePercentile;
  List<Sources>? sources;

  MovieDetails(
      {this.id,
      this.title,
      this.originalTitle,
      this.plotOverview,
      this.type,
      this.runtimeMinutes,
      this.year,
      this.endYear,
      this.releaseDate,
      this.imdbId,
      this.tmdbId,
      this.tmdbType,
      this.genres,
      this.genreNames,
      this.userRating,
      this.criticScore,
      this.usRating,
      this.poster,
      this.backdrop,
      this.originalLanguage,
      this.similarTitles,
      this.networks,
      this.networkNames,
      this.trailer,
      this.trailerThumbnail,
      this.relevancePercentile,
      this.sources});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
    plotOverview = json['plot_overview'];
    type = json['type'];
    runtimeMinutes = json['runtime_minutes'];
    year = json['year'];
    endYear = json['end_year'];
    releaseDate = json['release_date'];
    imdbId = json['imdb_id'];
    tmdbId = json['tmdb_id'];
    tmdbType = json['tmdb_type'];
    genres = json['genres'].cast<int>();
    genreNames = json['genre_names'].cast<String>();
    userRating = json['user_rating'];
    criticScore = json['critic_score'];
    usRating = json['us_rating'];
    poster = json['poster'];
    backdrop = json['backdrop'];
    originalLanguage = json['original_language'];
    similarTitles = json['similar_titles'].cast<int>();
    networks = json['networks'].cast<int>();
    networkNames = json['network_names'].cast<String>();
    trailer = json['trailer'];
    trailerThumbnail = json['trailer_thumbnail'];
    relevancePercentile = json['relevance_percentile'];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(new Sources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['original_title'] = originalTitle;
    data['plot_overview'] = plotOverview;
    data['type'] = type;
    data['runtime_minutes'] = runtimeMinutes;
    data['year'] = year;
    data['end_year'] = endYear;
    data['release_date'] = releaseDate;
    data['imdb_id'] = imdbId;
    data['tmdb_id'] = tmdbId;
    data['tmdb_type'] = tmdbType;
    data['genres'] = genres;
    data['genre_names'] = genreNames;
    data['user_rating'] = userRating;
    data['critic_score'] = criticScore;
    data['us_rating'] = usRating;
    data['poster'] = poster;
    data['backdrop'] = backdrop;
    data['original_language'] = originalLanguage;
    data['similar_titles'] = similarTitles;
    data['networks'] = networks;
    data['network_names'] = networkNames;
    data['trailer'] = trailer;
    data['trailer_thumbnail'] = trailerThumbnail;
    data['relevance_percentile'] = relevancePercentile;
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sources {
  int? sourceId;
  String? name;
  String? type;
  String? region;
  String? iosUrl;
  String? androidUrl;
  String? webUrl;
  String? format;
  double? price;
  int? seasons;
  int? episodes;

  Sources(
      {this.sourceId,
      this.name,
      this.type,
      this.region,
      this.iosUrl,
      this.androidUrl,
      this.webUrl,
      this.format,
      this.price,
      this.seasons,
      this.episodes});

  Sources.fromJson(Map<String, dynamic> json) {
    sourceId = json['source_id'];
    name = json['name'];
    type = json['type'];
    region = json['region'];
    iosUrl = json['ios_url'];
    androidUrl = json['android_url'];
    webUrl = json['web_url'];
    format = json['format'];
    price = json['price'];
    seasons = json['seasons'];
    episodes = json['episodes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source_id'] = sourceId;
    data['name'] = name;
    data['type'] = type;
    data['region'] = region;
    data['ios_url'] = iosUrl;
    data['android_url'] = androidUrl;
    data['web_url'] = webUrl;
    data['format'] = format;
    data['price'] = price;
    data['seasons'] = seasons;
    data['episodes'] = episodes;
    return data;
  }
}
