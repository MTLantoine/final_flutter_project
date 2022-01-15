import 'package:final_flutter_project/data/models/track.dart';
import 'package:final_flutter_project/data/repositories/deezer_api_repository.dart';
import 'package:final_flutter_project/data/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

import 'music_page.dart';

class CommentList extends StatefulWidget {
  const CommentList({Key? key, required this.trackId}) : super(key: key);

  final int trackId;

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  @override
  void initState() {
    getTrendingTracks();
    super.initState();
  }

  // Set firebase repo
  List<Comment> _comments = [];

  Future<void> getTrendingTracks() async {
    // call firebase
    setState(() {
      // set value to comments
      _comments = [
        Comment("Pierre", "Ceci est un commentaire"),
        Comment("Lulu", "Pas ouf le film"),
        Comment("Nicodrg", "La kiffance frrrrr"),
        Comment("Pierre", "Ceci est un commentaire")
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    if (_comments.isNotEmpty) {
      return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _comments.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: ListTile(
                  title: Text(_comments[index].author),
                  subtitle: Text(_comments[index].data),
                  leading: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/default-profile.png'))
                  )
              )
            );
          });
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
