/// id : 209875192
/// title : "La kiffance"
/// cover : "https://api.deezer.com/album/209875192/image"
/// cover_small : "https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/56x56-000000-80-0-0.jpg"
/// cover_medium : "https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/250x250-000000-80-0-0.jpg"
/// cover_big : "https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/500x500-000000-80-0-0.jpg"
/// cover_xl : "https://e-cdns-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/1000x1000-000000-80-0-0.jpg"
/// md5_image : "0846f00620ad172c934e89bcad774388"
/// tracklist : "https://api.deezer.com/album/209875192/tracks"
/// type : "album"

class Album {
  Album({
      int? id, 
      String? title, 
      String? cover, 
      String? coverSmall, 
      String? coverMedium, 
      String? coverBig, 
      String? coverXl, 
      String? md5Image, 
      String? tracklist, 
      String? type,}){
    _id = id;
    _title = title;
    _cover = cover;
    _coverSmall = coverSmall;
    _coverMedium = coverMedium;
    _coverBig = coverBig;
    _coverXl = coverXl;
    _md5Image = md5Image;
    _tracklist = tracklist;
    _type = type;
}

  Album.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _cover = json['cover'];
    _coverSmall = json['cover_small'];
    _coverMedium = json['cover_medium'];
    _coverBig = json['cover_big'];
    _coverXl = json['cover_xl'];
    _md5Image = json['md5_image'];
    _tracklist = json['tracklist'];
    _type = json['type'];
  }
  int? _id;
  String? _title;
  String? _cover;
  String? _coverSmall;
  String? _coverMedium;
  String? _coverBig;
  String? _coverXl;
  String? _md5Image;
  String? _tracklist;
  String? _type;

  int? get id => _id;
  String? get title => _title;
  String? get cover => _cover;
  String? get coverSmall => _coverSmall;
  String? get coverMedium => _coverMedium;
  String? get coverBig => _coverBig;
  String? get coverXl => _coverXl;
  String? get md5Image => _md5Image;
  String? get tracklist => _tracklist;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['cover'] = _cover;
    map['cover_small'] = _coverSmall;
    map['cover_medium'] = _coverMedium;
    map['cover_big'] = _coverBig;
    map['cover_xl'] = _coverXl;
    map['md5_image'] = _md5Image;
    map['tracklist'] = _tracklist;
    map['type'] = _type;
    return map;
  }

}