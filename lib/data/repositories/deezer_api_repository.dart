import 'package:final_flutter_project/data/models/track.dart';
import 'package:final_flutter_project/data/providers/deezer_api_provider.dart';

class DeezerApiRepository {

  static final DeezerApiRepository _singleton = DeezerApiRepository._internal();

  factory DeezerApiRepository() => _singleton;

  DeezerApiRepository._internal();

  Future<List<Track>> getTrendingTracks() async {
    var deezerApiProvider = DeezerApiProvider();
    return await deezerApiProvider.getTrendingTracks();
  }
}