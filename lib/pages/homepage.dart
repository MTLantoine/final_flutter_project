import 'package:final_flutter_project/data/models/track.dart';
import 'package:final_flutter_project/data/repositories/deezer_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  _HomePageState() {
    getTrendingTracks();
  }

  DeezerApiRepository deezerApiRepository = DeezerApiRepository();
  List<Track> _tracks = [];

  Future<void> getTrendingTracks() async {
    var data = await deezerApiRepository.getTrendingTracks();
    setState(()  {
      _tracks = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music critizer'),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: _tracks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_tracks[index].title ?? "Vide"),
        );
      },
    );
  }
}
