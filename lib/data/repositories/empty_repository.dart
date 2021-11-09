import 'package:flutter/widgets.dart';

class EmptyRepository extends StatefulWidget {
  const EmptyRepository({Key? key}) : super(key: key);

  @override
  _EmptyRepositoryState createState() => _EmptyRepositoryState();
}

class _EmptyRepositoryState extends State<EmptyRepository> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
