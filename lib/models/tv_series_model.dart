import 'dart:convert';

class TvSeriesModel {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    TvSeriesModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    TvSeriesModel copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        TvSeriesModel(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory TvSeriesModel.fromRawJson(String str) => TvSeriesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    String backdropPath;
    int id;
    String originalName;
    String overview;
    String posterPath;
    MediaType mediaType;
    bool adult;
    String name;
    OriginalLanguage originalLanguage;
    List<int> genreIds;
    double popularity;
    DateTime firstAirDate;
    double voteAverage;
    int voteCount;
    List<OriginCountry> originCountry;

    Result({
        required this.backdropPath,
        required this.id,
        required this.originalName,
        required this.overview,
        required this.posterPath,
        required this.mediaType,
        required this.adult,
        required this.name,
        required this.originalLanguage,
        required this.genreIds,
        required this.popularity,
        required this.firstAirDate,
        required this.voteAverage,
        required this.voteCount,
        required this.originCountry,
    });

    Result copyWith({
        String? backdropPath,
        int? id,
        String? originalName,
        String? overview,
        String? posterPath,
        MediaType? mediaType,
        bool? adult,
        String? name,
        OriginalLanguage? originalLanguage,
        List<int>? genreIds,
        double? popularity,
        DateTime? firstAirDate,
        double? voteAverage,
        int? voteCount,
        List<OriginCountry>? originCountry,
    }) => 
        Result(
            backdropPath: backdropPath ?? this.backdropPath,
            id: id ?? this.id,
            originalName: originalName ?? this.originalName,
            overview: overview ?? this.overview,
            posterPath: posterPath ?? this.posterPath,
            mediaType: mediaType ?? this.mediaType,
            adult: adult ?? this.adult,
            name: name ?? this.name,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            genreIds: genreIds ?? this.genreIds,
            popularity: popularity ?? this.popularity,
            firstAirDate: firstAirDate ?? this.firstAirDate,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
            originCountry: originCountry ?? this.originCountry,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        adult: json["adult"],
        name: json["name"],
        originalLanguage: originalLanguageValues.map[json["original_language"]]!,
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: List<OriginCountry>.from(json["origin_country"].map((x) => originCountryValues.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "adult": adult,
        "name": name,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": List<dynamic>.from(originCountry.map((x) => originCountryValues.reverse[x])),
    };
}

enum MediaType {
    TV
}

final mediaTypeValues = EnumValues({
    "tv": MediaType.TV
});

enum OriginCountry {
    CA,
    GB,
    US
}

final originCountryValues = EnumValues({
    "CA": OriginCountry.CA,
    "GB": OriginCountry.GB,
    "US": OriginCountry.US
});

enum OriginalLanguage {
    EN
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
