import 'package:final_flutter_project/data/models/embed.dart';
import 'package:final_flutter_project/data/repositories/deezer_api_repository.dart';
import 'package:final_flutter_project/pages/web/comment_list_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:final_flutter_project/pages/android/comment_list_android.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key, this.infos}) : super(key: key);
  final infos;

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  void initState() {
    updateColorAsync();
    getEmbedMusic(widget.infos.id);
    _isEmbed = _embed.id != null && _embed.id != -1;
    super.initState();
  }

  DeezerApiRepository deezerApiRepository = DeezerApiRepository();
  Color _color = Colors.white;
  Embed _embed = Embed(html: "");
  bool _isEmbed = false;

  Future<void> getEmbedMusic(value) async {
    var data = await deezerApiRepository.getEmbedMusic(value);
    setState(() {
      _embed = data!;
    });
  }

  void updateColorAsync() async {
    var provider = Image.network(widget.infos.album.coverBig);
    var colorTmp = await getImagePalette(provider.image);
    setState(() {
      _color = darken(colorTmp, 0.25);
    });
  }

  // Calculate dominant color from ImageProvider
  Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor!.color;
  }

  // ranges from 0.0 to 1.0
  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        backgroundColor: _color,
        body: Container(
          margin: EdgeInsets.fromLTRB(
              kIsWeb ? MediaQuery.of(context).size.width * 0.3 : 0,
              0,
              kIsWeb ? MediaQuery.of(context).size.width * 0.3 : 0,
              0),
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 75,
                child: Column(
                  children: <Widget>[
                    _isEmbed ? _getImage() : _getEmbedHtml(),
                    Expanded(
                        child: kIsWeb
                            ? CommentListWeb(trackId: widget.infos.id ?? -1)
                            : CommentListAndroid(
                                trackId: widget.infos.id ?? -1))
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _getEmbedHtml() {
    return Center(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Html(
            data: _embed.html,
          )),
    );
  }

  Widget _getImage() {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  widget.infos.album.coverBig,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0))),
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              child: Text(
                widget.infos.title,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
