import 'dart:async';

import 'package:final_flutter_project/data/models/search.dart';
import 'package:final_flutter_project/data/models/track.dart';
import 'package:final_flutter_project/data/repositories/deezer_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

import 'music_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getTrendingTracks();
    super.initState();
  }

  DeezerApiRepository deezerApiRepository = DeezerApiRepository();
  List<Track> _tracks = [];
  List<Search> _searchs = [];
  bool _showMusicSearch = false;
  Timer? _debounce;

  Future<void> getTrendingTracks() async {
    var data = await deezerApiRepository.getTrendingTracks();
    setState(() {
      _tracks = data;
    });
  }

  Future<void> getSearchMusic(value) async {
    var data = await deezerApiRepository.getSearchMusic(value);
    setState(() {
      _searchs = data;
      _showMusicSearch = value.isNotEmpty;
    });
  }

  void _onSearchChange(value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 50), () {
      getSearchMusic(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spoteezer'),
        centerTitle: true,
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    if (_tracks.isNotEmpty) {
      return Container(
        margin: EdgeInsets.fromLTRB(
            kIsWeb ? MediaQuery.of(context).size.width * 0.3 : 0,
            0,
            kIsWeb ? MediaQuery.of(context).size.width * 0.3 : 0,
            0),        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Column(
          children: <Widget>[
            _getSearchBar(),
            Expanded(
              child: _showMusicSearch ? _getSearchMusic() : _getMusicList(),
            )
          ],
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator(color: Colors.red));
    }
  }

  Widget _getSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextField(
                    onChanged: (value) {
                      _onSearchChange(value);
                    },
                    decoration: InputDecoration(
                        hintText: 'Artistes, titres ou podcasts',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.search),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ),
            ],
          )),
    );
  }

  Widget _getMusicList() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: _tracks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_tracks[index].title ?? "Titre inconnu"),
          leading: Image.network(_tracks[index].album!.cover ?? ""),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => MusicPage(infos: _tracks[index])),
            );
          },
        );
      },
    );
  }

  Widget _getSearchMusic() {
    if (_searchs.isNotEmpty) {
      return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _searchs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchs[index].title ?? "Titre inconnu"),
            leading: Image.network(_searchs[index].album!.cover ?? ""),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MusicPage(infos: _searchs[index])),
              );
            },
          );
        },
      );
    } else {
      return const Center(
          child: Text('Votre recherche n\'a donné aucun résultat :/'));
    }
  }
}
