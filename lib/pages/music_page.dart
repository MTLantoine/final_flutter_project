import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:final_flutter_project/pages/comment_list.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({Key? key, this.infos}) : super(key: key);

  final infos;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body:
        Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Image.network(
                      infos.album.coverBig,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.black.withOpacity(0.5),
                      width: double.infinity,
                      child: Text(
                        infos.title,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Fancy, Horror',
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: CommentList(
                      trackId: infos.id ?? -1,
                    )
                )
                // Column(children: _displayCharacterInformations(details)),
              ],
            ),
          ),
        ),
      );
}
