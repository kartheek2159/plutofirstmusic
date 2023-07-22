part of 'trackbloc_bloc.dart';

@immutable
abstract class TrackblocState {}

class TrackblocInitial extends TrackblocState {}

class TrackFetchLoad extends TrackblocState {}

class TrackFetcherror extends TrackblocState {}

class TrackFetch extends TrackblocState {
  final List<Track> tracks;
  TrackFetch({
    required this.tracks,
  });
}

class TrackdetailFetchLoad extends TrackblocState {}

class TrackdetailFetcherror extends TrackblocState {}

class TrackDetailFetch extends TrackblocState {
  final Track t;
  TrackDetailFetch({
    required this.t,
  });
}

class TrackLyricsload extends TrackblocState {}

class TrackLyricserror extends TrackblocState {}

class Tracklyricsfetch extends TrackblocState {
  final String lyrics;
  Tracklyricsfetch({
    required this.lyrics,
  });
}
