/// id : 4842061
/// name : "Naps"
/// link : "https://www.deezer.com/artist/4842061"
/// picture : "https://api.deezer.com/artist/4842061/image"
/// picture_small : "https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/56x56-000000-80-0-0.jpg"
/// picture_medium : "https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/250x250-000000-80-0-0.jpg"
/// picture_big : "https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/500x500-000000-80-0-0.jpg"
/// picture_xl : "https://e-cdns-images.dzcdn.net/images/artist/dc6128ab332c21ebc77ce01df5dd2652/1000x1000-000000-80-0-0.jpg"
/// radio : true
/// tracklist : "https://api.deezer.com/artist/4842061/top?limit=50"
/// type : "artist"

class Artist {
  Artist({
      int? id, 
      String? name, 
      String? link, 
      String? picture, 
      String? pictureSmall, 
      String? pictureMedium, 
      String? pictureBig, 
      String? pictureXl, 
      bool? radio, 
      String? tracklist, 
      String? type,}){
    _id = id;
    _name = name;
    _link = link;
    _picture = picture;
    _pictureSmall = pictureSmall;
    _pictureMedium = pictureMedium;
    _pictureBig = pictureBig;
    _pictureXl = pictureXl;
    _radio = radio;
    _tracklist = tracklist;
    _type = type;
}

  Artist.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _picture = json['picture'];
    _pictureSmall = json['picture_small'];
    _pictureMedium = json['picture_medium'];
    _pictureBig = json['picture_big'];
    _pictureXl = json['picture_xl'];
    _radio = json['radio'];
    _tracklist = json['tracklist'];
    _type = json['type'];
  }
  int? _id;
  String? _name;
  String? _link;
  String? _picture;
  String? _pictureSmall;
  String? _pictureMedium;
  String? _pictureBig;
  String? _pictureXl;
  bool? _radio;
  String? _tracklist;
  String? _type;

  int? get id => _id;
  String? get name => _name;
  String? get link => _link;
  String? get picture => _picture;
  String? get pictureSmall => _pictureSmall;
  String? get pictureMedium => _pictureMedium;
  String? get pictureBig => _pictureBig;
  String? get pictureXl => _pictureXl;
  bool? get radio => _radio;
  String? get tracklist => _tracklist;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['link'] = _link;
    map['picture'] = _picture;
    map['picture_small'] = _pictureSmall;
    map['picture_medium'] = _pictureMedium;
    map['picture_big'] = _pictureBig;
    map['picture_xl'] = _pictureXl;
    map['radio'] = _radio;
    map['tracklist'] = _tracklist;
    map['type'] = _type;
    return map;
  }

}