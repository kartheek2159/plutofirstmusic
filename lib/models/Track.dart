class Track {
  final int trackId;
  final String trackName;
  final int trackRating;
  final int commontrackId;
  final int instrumental;
  final int explicit;
  final int hasLyrics;
  final int hasSubtitles;
  final int hasRichsync;
  final int numFavourite;
  final int albumId;
  final String albumName;
  final int artistId;
  final String artistName;
  final String trackShareUrl;
  final String trackEditUrl;
  final int restricted;
  final DateTime updatedTime;
  final List<MusicGenre> primaryGenres;

  Track({
    required this.trackId,
    required this.trackName,
    required this.trackRating,
    required this.commontrackId,
    required this.instrumental,
    required this.explicit,
    required this.hasLyrics,
    required this.hasSubtitles,
    required this.hasRichsync,
    required this.numFavourite,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.trackShareUrl,
    required this.trackEditUrl,
    required this.restricted,
    required this.updatedTime,
    required this.primaryGenres,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      trackId: json['track_id'],
      trackName: json['track_name'],
      trackRating: json['track_rating'],
      commontrackId: json['commontrack_id'],
      instrumental: json['instrumental'],
      explicit: json['explicit'],
      hasLyrics: json['has_lyrics'],
      hasSubtitles: json['has_subtitles'],
      hasRichsync: json['has_richsync'],
      numFavourite: json['num_favourite'],
      albumId: json['album_id'],
      albumName: json['album_name'],
      artistId: json['artist_id'],
      artistName: json['artist_name'],
      trackShareUrl: json['track_share_url'],
      trackEditUrl: json['track_edit_url'],
      restricted: json['restricted'],
      updatedTime: DateTime.parse(json['updated_time']),
      primaryGenres:
          List<MusicGenre>.from(json['primary_genres']['music_genre_list'].map(
        (genre) => MusicGenre.fromJson(genre['music_genre']),
      )),
    );
  }
}

class MusicGenre {
  final int musicGenreId;
  final int musicGenreParentId;
  final String musicGenreName;
  final String musicGenreNameExtended;
  final String musicGenreVanity;

  MusicGenre({
    required this.musicGenreId,
    required this.musicGenreParentId,
    required this.musicGenreName,
    required this.musicGenreNameExtended,
    required this.musicGenreVanity,
  });

  factory MusicGenre.fromJson(Map<String, dynamic> json) {
    return MusicGenre(
      musicGenreId: json['music_genre_id'],
      musicGenreParentId: json['music_genre_parent_id'],
      musicGenreName: json['music_genre_name'],
      musicGenreNameExtended: json['music_genre_name_extended'],
      musicGenreVanity: json['music_genre_vanity'],
    );
  }
}
