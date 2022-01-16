import 'dart:convert';

import 'package:final_flutter_project/data/models/embed.dart';
import 'package:final_flutter_project/data/models/search.dart';
import 'package:final_flutter_project/data/models/track.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeezerApiProvider {
  static final DeezerApiProvider _singleton = DeezerApiProvider._internal();

  factory DeezerApiProvider() => _singleton;

  DeezerApiProvider._internal();

  final String _baseUrl = 'api.deezer.com';

  Future<List<Track>> getTrendingTracks() async {
    var uri = Uri.https(_baseUrl, '/chart');
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      if (json['tracks']['data'] == null) {
        debugPrint("Wrong JSON format");
        return List<Track>.empty();
      }
      List<Track> tracks = [];
      json['tracks']['data']
          .forEach((track) => tracks.add(Track.fromJson(track)));

      return tracks;
    }

    return [];
  }

  Future<List<Search>> getSearchMusic(value) async {
    var params = {
      'q': value,
    };
    var uri = Uri.https(_baseUrl, '/search', params);
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      if (json['data'] == null) {
        debugPrint("Wrong JSON format");
        return List<Search>.empty();
      }
      List<Search> searchs = [];
      json['data'].forEach((track) => searchs.add(Search.fromJson(track)));
      return searchs;
    }
    return [];
  }

  Future<Embed?> getEmbedMusic(value) async {
    var uri = Uri.parse('https://api.deezer.com/oembed?url=https://www.deezer.com/track/$value');
    var res = await http.get(uri);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      Embed embed = Embed.fromJson(json);
      return embed;
    }
    return null;
  }
}
