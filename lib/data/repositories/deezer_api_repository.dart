import 'package:final_flutter_project/data/models/search.dart';
import 'package:final_flutter_project/data/models/track.dart';
import 'package:final_flutter_project/data/providers/deezer_api_provider.dart';

class DeezerApiRepository {
  static final DeezerApiRepository _singleton = DeezerApiRepository._internal();

  factory DeezerApiRepository() => _singleton;

  DeezerApiRepository._internal();
  var deezerApiProvider = DeezerApiProvider();

  Future<List<Track>> getTrendingTracks() async {
    return await deezerApiProvider.getTrendingTracks();
  }

  Future<List<Search>> getSearchMusic() async {
    return await deezerApiProvider.getSearchMusic();
  }
}
