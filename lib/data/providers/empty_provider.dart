import 'package:flutter/widgets.dart';

class EmptyProvider extends StatefulWidget {
  const EmptyProvider({Key? key}) : super(key: key);

  @override
  _EmptyProviderState createState() => _EmptyProviderState();
}

class _EmptyProviderState extends State<EmptyProvider> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
