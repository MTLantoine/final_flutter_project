import 'dart:convert';

import 'package:final_flutter_project/api/track.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeezerService {
  final String _baseUrl = 'https://api.deezer.com';

  Future<List<Track>> getTrendingTracks() async {
    var uri = Uri.https(_baseUrl, '/chart');
    var res = await http.get(uri);
    var json = jsonDecode(res.body);

    if (json['tracks']['data'] == null) {
      debugPrint("Wrong JSON format");
      return List<Track>.empty();
    }

    var tracks = (json as List<Track>).map((track) => Track.fromJson(track)).toList();

    return tracks;
  }
}