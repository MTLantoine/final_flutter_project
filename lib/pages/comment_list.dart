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
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();

  @override
  void initState() {
    getCommentFromFirebase();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _commentController.dispose();
    super.dispose();
  }

  // Set firebase repo
  List<Comment> _comments = [];
  var currentFocus;

  void _addCommentToFirebase(String comment) {
    if (comment.isEmpty) {
      return;
    }
    // TODO : save the comment to firebase and replace Pierre by the current user
    _comments.add(Comment("Pierre", comment));
    clearCommentAndRemoveFocus();
  }

  void clearCommentAndRemoveFocus() {
    _commentController.text = "";
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Future<void> getCommentFromFirebase() async {
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
      return Column(children: [
        Expanded(
            child: Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: _comments.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: ListTile(
                              title: Text(_comments[index].author),
                              subtitle: Text(_comments[index].data),
                              leading: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          'assets/default-profile.png')))));
                    }))),
        Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: _commentController,
              maxLines: 4,
              minLines: 1,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  fillColor: Colors.black,
                  filled: true,
                  labelText: "Write down your comment",
                  labelStyle: const TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        _addCommentToFirebase(_commentController.text),
                    icon: const Icon(Icons.send),
                    color: Colors.white,
                  )),
            ))
      ]);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
