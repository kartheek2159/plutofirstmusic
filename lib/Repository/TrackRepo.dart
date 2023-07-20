import '../models/Track.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class TrackRepo {
  static Future<List<Track>> FetchTracks() async {
    var client = http.Client();
    try {
      List<Track> tracks = [];
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=8d0af565a66a1b81b7faeac72beb206a'));
      // print(response.body);
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
}
