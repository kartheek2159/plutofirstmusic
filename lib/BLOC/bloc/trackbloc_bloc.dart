import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:plutofirstmusic/Repository/TrackRepo.dart';

import '../../models/Track.dart';

part 'trackbloc_event.dart';
part 'trackbloc_state.dart';

class TrackblocBloc extends Bloc<TrackblocEvent, TrackblocState> {
  TrackblocBloc() : super(TrackblocInitial()) {
    on<TrackInitialfetch>(trackfetchinitial);
  }

  FutureOr<void> trackfetchinitial(
      TrackInitialfetch event, Emitter<TrackblocState> emit) async {
    emit(TrackFetchLoad());
    List<Track> tracks = await TrackRepo.FetchTracks();
    try {
      emit(TrackFetch(tracks: tracks));
    } catch (e) {
      emit(TrackFetcherror());
      log(e.toString());
    }
  }
}
