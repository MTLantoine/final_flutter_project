import 'dart:convert';

import 'package:final_flutter_project/data/models/track.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeezerApiProvider {

  static final DeezerApiProvider _singleton = DeezerApiProvider._internal();

  factory DeezerApiProvider() => _singleton;

  DeezerApiProvider._internal();

  final String _baseUrl = 'https://api.deezer.com';

  Future<List<Track>> getTrendingTracks() async {
    var uri = Uri.https(_baseUrl, '/chart');
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);

      if (json['tracks']['data'] == null) {
        debugPrint("Wrong JSON format");
        return List<Track>.empty();
      }

      var tracks = (json as List<Track>).map((track) => Track.fromJson(track)).toList();

      return tracks;
    }

    return [];
  }
}