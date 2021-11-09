import 'package:flutter/widgets.dart';

class EmptyModel extends StatefulWidget {
  const EmptyModel({Key? key}) : super(key: key);

  @override
  _EmptyModelState createState() => _EmptyModelState();
}

class _EmptyModelState extends State<EmptyModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
