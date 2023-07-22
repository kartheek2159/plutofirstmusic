part of 'trackbloc_bloc.dart';

@immutable
abstract class TrackblocEvent {}

class TrackInitialfetch extends TrackblocEvent {}

class Trackdetailfetch extends TrackblocEvent {
  final String trackid;
  Trackdetailfetch({
    required this.trackid,
  });
}

class TrackLyricsfetch extends TrackblocEvent {
  final String trackid;
  TrackLyricsfetch({
    required this.trackid,
  });
}
