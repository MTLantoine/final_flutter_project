import 'dart:convert';

import 'package:final_flutter_project/data/models/track.dart';
import 'package:final_flutter_project/data/repositories/deezer_api_repository.dart';
import 'package:final_flutter_project/data/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'music_page.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final firestoreInstance = FirebaseFirestore.instance;

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
    getCommentsFromFirebase();
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

    //get firstname for current user
    final User? user = auth.currentUser;
    String resName = "Pierre";

    firestoreInstance.collection("users").doc(user!.uid).get().then((value) {
      //TODO : Update list when new comment written
      resName = value.data()!["firstName"];

      firestoreInstance.collection("comments").add({
        "author": resName,
        "createdAt": Timestamp.now(),
        "data": comment,
        "trackId": widget.trackId, //TODO : Get current track ID
        "updatedAt": Timestamp.now()
      }).then(
          (value) => {getCommentsFromFirebase(), clearCommentAndRemoveFocus()});
    });
  }

  void clearCommentAndRemoveFocus() {
    _commentController.text = "";
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _onAddCommentChange(value) {
    if (value.contains('\n')) {
      FocusScope.of(context).requestFocus(FocusNode());
      _addCommentToFirebase(value);
    }
  }

  Future<void> getCommentsFromFirebase() async {
    // TODO : Add track ID for comments (.where(trackId,isEqualTo:...))

    firestoreInstance
        .collection("comments")
        .where("trackId", isEqualTo: widget.trackId)
        .orderBy("createdAt", descending: true)
        .get()
        .then((querySnapshot) {
      print(widget.trackId);
      List<Comment> resComments = [];
      for (var result in querySnapshot.docs) {
        resComments
            .add(Comment(result.data()["author"], result.data()["data"]));
      }
      // call firebase
      setState(() {
        // set value to comments
        _comments = resComments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 100, child: _getCommentList()),
          _getCommentInput(),
        ],
      ),
    );
  }

  Widget _getCommentList() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/default-profile.png')))));
          }),
    );
  }

  Widget _getCommentInput() {
    return Form(
        key: _formKey,
        child: TextFormField(
          onChanged: (value) {
            _onAddCommentChange(value);
          },
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
                onPressed: () => _addCommentToFirebase(_commentController.text),
                icon: const Icon(Icons.send),
                color: Colors.white,
              )),
        ));
  }
}
