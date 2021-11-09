import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> getAllCharacters() async {
    var uri = Uri.parse('https://rickandmortyapi.com/api/character');
    var responseFromApi = await http.get(uri);
    if (responseFromApi.statusCode == 200) {
      setState(() {
        print("WOOORKS");
      });
    }
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
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Vide"),
          leading: Image.network(""),
        );
      },
    );
  }
}
