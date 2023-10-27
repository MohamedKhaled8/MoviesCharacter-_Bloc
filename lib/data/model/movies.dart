import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String boxOffice;
  final int duration;
  final String overview;
  final String coverUrl;
  final String trailerUrl;
  final String directedBy;
  final int phase;
  final String saga;
  final int chronology;
  final int postCreditScenes;
  final String imdbId;
  final String updatedAt;

  const MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.boxOffice,
    required this.duration,
    required this.overview,
    required this.coverUrl,
    required this.trailerUrl,
    required this.directedBy,
    required this.phase,
    required this.saga,
    required this.chronology,
    required this.postCreditScenes,
    required this.imdbId,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        releaseDate,
        boxOffice,
        duration,
        overview,
        coverUrl,
        trailerUrl,
        directedBy,
        phase,
        saga,
        chronology,
        postCreditScenes,
        imdbId,
        updatedAt,
      ];

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      boxOffice: json['box_office'],
      duration: json['duration'],
      overview: json['overview'],
      coverUrl: json['cover_url'],
      trailerUrl: json['trailer_url'],
      directedBy: json['directed_by'],
      phase: json['phase'],
      saga: json['saga'],
      chronology: json['chronology'],
      postCreditScenes: json['post_credit_scenes'],
      imdbId: json['imdb_id'],
      updatedAt: json['updated_at'],
    );
  }
}
