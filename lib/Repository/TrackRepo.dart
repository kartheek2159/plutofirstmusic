import '../models/Track.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class TrackFetchException implements Exception {
  final String message;
  TrackFetchException(this.message);
}

class TrackRepo {
  static Future<List<Track>> FetchTracks() async {
    var client = http.Client();
    try {
      List<Track> tracks = [];
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=8d0af565a66a1b81b7faeac72beb206a'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> trackList = jsonResponse['message']['body']['track_list'];
      for (int i = 0; i < trackList.length; i++) {
        Track t = Track.fromJson(trackList[i]['track']);
        tracks.add(t);
      }
      return tracks;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<Track> detailFetch(String trackId) async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=8d0af565a66a1b81b7faeac72beb206a'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var trackList = jsonResponse['message']['body'];
      Track t = Track.fromJson(trackList['track']);
      return t;
    } catch (e) {
      log(e.toString());
      throw TrackFetchException('Error fetching track details');
    }
  }

  static Future<String> lyricsfetch(String trackId) async {
    var client = http.Client();
    try {
      String lyrics = "";
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=8d0af565a66a1b81b7faeac72beb206a'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      lyrics = jsonResponse['message']['body']['lyrics']['lyrics_body'];
      return lyrics;
    } catch (e) {
      log(e.toString());
      throw TrackFetchException('Error fetching track details');
    }
  }
}
