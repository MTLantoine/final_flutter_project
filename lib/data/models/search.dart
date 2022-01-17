import 'artist.dart';
import 'album.dart';

/// id : 1109731
/// readable : true
/// title : "Lose Yourself (From \"8 Mile\" Soundtrack)"
/// title_short : "Lose Yourself"
/// title_version : "(From \"8 Mile\" Soundtrack)"
/// link : "https://www.deezer.com/track/1109731"
/// duration : 326
/// rank : 952888
/// explicit_lyrics : true
/// explicit_content_lyrics : 1
/// explicit_content_cover : 0
/// preview : "https://cdns-preview-1.dzcdn.net/stream/c-13039fed16a173733f227b0bec631034-12.mp3"
/// md5_image : "e2b36a9fda865cb2e9ed1476b6291a7d"
/// artist : {"id":13,"name":"Eminem","link":"https://www.deezer.com/artist/13","picture":"https://api.deezer.com/artist/13/image","picture_small":"https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/56x56-000000-80-0-0.jpg","picture_medium":"https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/250x250-000000-80-0-0.jpg","picture_big":"https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/500x500-000000-80-0-0.jpg","picture_xl":"https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/1000x1000-000000-80-0-0.jpg","tracklist":"https://api.deezer.com/artist/13/top?limit=50","type":"artist"}
/// album : {"id":119606,"title":"Curtain Call: The Hits","cover":"https://api.deezer.com/album/119606/image","cover_small":"https://e-cdns-images.dzcdn.net/images/cover/e2b36a9fda865cb2e9ed1476b6291a7d/56x56-000000-80-0-0.jpg","cover_medium":"https://e-cdns-images.dzcdn.net/images/cover/e2b36a9fda865cb2e9ed1476b6291a7d/250x250-000000-80-0-0.jpg","cover_big":"https://e-cdns-images.dzcdn.net/images/cover/e2b36a9fda865cb2e9ed1476b6291a7d/500x500-000000-80-0-0.jpg","cover_xl":"https://e-cdns-images.dzcdn.net/images/cover/e2b36a9fda865cb2e9ed1476b6291a7d/1000x1000-000000-80-0-0.jpg","md5_image":"e2b36a9fda865cb2e9ed1476b6291a7d","tracklist":"https://api.deezer.com/album/119606/tracks","type":"album"}
/// type : "track"

class Search {
  Search({
      int? id, 
      bool? readable, 
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
      Artist? artist, 
      Album? album, 
      String? type,}){
    _id = id;
    _readable = readable;
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
    _artist = artist;
    _album = album;
    _type = type;
}

  Search.fromJson(dynamic json) {
    _id = json['id'];
    _readable = json['readable'];
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
    _artist = json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    _album = json['album'] != null ? Album.fromJson(json['album']) : null;
    _type = json['type'];
  }
  int? _id;
  bool? _readable;
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
  Artist? _artist;
  Album? _album;
  String? _type;

  int? get id => _id;
  bool? get readable => _readable;
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
  Artist? get artist => _artist;
  Album? get album => _album;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['readable'] = _readable;
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