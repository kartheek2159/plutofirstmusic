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
