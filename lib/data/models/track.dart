import 'artist.dart';
import 'album.dart';

/// id : 1253711502
/// title : "La kiffance"
/// title_short : "La kiffance"
/// title_version : ""
/// link : "https://www.deezer.com/track/1253711502"
/// duration : 179
/// rank : 998563
/// explicit_lyrics : true
/// explicit_content_lyrics : 0
/// explicit_content_cover : 0
/// preview : "https://cdns-preview-d.dzcdn.net/stream/c-df6977f93944728acc7db2f4866abfa0-4.mp3"
/// md5_image : "0846f00620ad172c934e89bcad774388"
/// position : 1
/// artist : {"id":4842061,"name":"Naps","link":"https://www.deezer.com/artist/4842061","picture":"https://api.deezer.com/artist/4842061/image","picture_small":"https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/56x56-000000-80-0-0.jpg","picture_medium":"https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/250x250-000000-80-0-0.jpg","picture_big":"https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/500x500-000000-80-0-0.jpg","picture_xl":"https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/1000x1000-000000-80-0-0.jpg","radio":true,"tracklist":"https://api.deezer.com/artist/4842061/top?limit=50","type":"artist"}
/// album : {"id":209875192,"title":"La kiffance","cover":"https://api.deezer.com/album/209875192/image","cover_small":"https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/56x56-000000-80-0-0.jpg","cover_medium":"https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/250x250-000000-80-0-0.jpg","cover_big":"https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/500x500-000000-80-0-0.jpg","cover_xl":"https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/1000x1000-000000-80-0-0.jpg","md5_image":"0846f00620ad172c934e89bcad774388","tracklist":"https://api.deezer.com/album/209875192/tracks","type":"album"}
/// type : "track"

class Track {
  Track({
      int? id, 
      String? title, 
      String? titleShort, 
      String? titleVersion, 
      String? link, 
      int? duration, 
      int? rank, 
      bool? explicitLyrics, 
      int? explicitContentLyrics, 
      int? explicitContentCover, 
      String? preview, 
      String? md5Image, 
      int? position, 
      Artist? artist, 
      Album? album, 
      String? type,}){
    _id = id;
    _title = title;
    _titleShort = titleShort;
    _titleVersion = titleVersion;
    _link = link;
    _duration = duration;
    _rank = rank;
    _explicitLyrics = explicitLyrics;
    _explicitContentLyrics = explicitContentLyrics;
    _explicitContentCover = explicitContentCover;
    _preview = preview;
    _md5Image = md5Image;
    _position = position;
    _artist = artist;
    _album = album;
    _type = type;
}

  Track.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _titleShort = json['title_short'];
    _titleVersion = json['title_version'];
    _link = json['link'];
    _duration = json['duration'];
    _rank = json['rank'];
    _explicitLyrics = json['explicit_lyrics'];
    _explicitContentLyrics = json['explicit_content_lyrics'];
    _explicitContentCover = json['explicit_content_cover'];
    _preview = json['preview'];
    _md5Image = json['md5_image'];
    _position = json['position'];
    _artist = json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    _album = json['album'] != null ? Album.fromJson(json['album']) : null;
    _type = json['type'];
  }
  int? _id;
  String? _title;
  String? _titleShort;
  String? _titleVersion;
  String? _link;
  int? _duration;
  int? _rank;
  bool? _explicitLyrics;
  int? _explicitContentLyrics;
  int? _explicitContentCover;
  String? _preview;
  String? _md5Image;
  int? _position;
  Artist? _artist;
  Album? _album;
  String? _type;

  int? get id => _id;
  String? get title => _title;
  String? get titleShort => _titleShort;
  String? get titleVersion => _titleVersion;
  String? get link => _link;
  int? get duration => _duration;
  int? get rank => _rank;
  bool? get explicitLyrics => _explicitLyrics;
  int? get explicitContentLyrics => _explicitContentLyrics;
  int? get explicitContentCover => _explicitContentCover;
  String? get preview => _preview;
  String? get md5Image => _md5Image;
  int? get position => _position;
  Artist? get artist => _artist;
  Album? get album => _album;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['title_short'] = _titleShort;
    map['title_version'] = _titleVersion;
    map['link'] = _link;
    map['duration'] = _duration;
    map['rank'] = _rank;
    map['explicit_lyrics'] = _explicitLyrics;
    map['explicit_content_lyrics'] = _explicitContentLyrics;
    map['explicit_content_cover'] = _explicitContentCover;
    map['preview'] = _preview;
    map['md5_image'] = _md5Image;
    map['position'] = _position;
    if (_artist != null) {
      map['artist'] = _artist?.toJson();
    }
    if (_album != null) {
      map['album'] = _album?.toJson();
    }
    map['type'] = _type;
    return map;
  }

}