/// version : "1.0"
/// type : "rich"
/// cache_age : 86400
/// provider_name : "Deezer"
/// provider_url : "https://www.deezer.com"
/// entity : "track"
/// id : 3135553
/// url : "https://www.deezer.com/fr/track/3135553"
/// author_name : "Daft Punk"
/// title : "One More Time"
/// thumbnail_url : "https://cdns-images.dzcdn.net/images/cover/2e018122cb56986277102d2041a592c8/1000x1000.jpg"
/// thumbnail_width : 1000
/// thumbnail_height : 1000
/// width : 420
/// height : 420
/// html : "<iframe id=\"deezer-widget\" src=\"https://widget.deezer.com/widget/dark/track/3135553?app_id=457142&autoplay=false&radius=true&tracklist=false\" width=\"420\" height=\"420\" allowtransparency=\"true\" allowfullscreen=\"true\" allow=\"encrypted-media\"></iframe>"

class Embed {
  Embed({
      String? version, 
      String? type, 
      int? cacheAge, 
      String? providerName, 
      String? providerUrl, 
      String? entity, 
      int? id, 
      String? url, 
      String? authorName, 
      String? title, 
      String? thumbnailUrl, 
      int? thumbnailWidth, 
      int? thumbnailHeight, 
      int? width, 
      int? height, 
      String? html,}){
    _version = version;
    _type = type;
    _cacheAge = cacheAge;
    _providerName = providerName;
    _providerUrl = providerUrl;
    _entity = entity;
    _id = id;
    _url = url;
    _authorName = authorName;
    _title = title;
    _thumbnailUrl = thumbnailUrl;
    _thumbnailWidth = thumbnailWidth;
    _thumbnailHeight = thumbnailHeight;
    _width = width;
    _height = height;
    _html = html;
}

  Embed.fromJson(dynamic json) {
    _version = json['version'];
    _type = json['type'];
    _cacheAge = json['cache_age'];
    _providerName = json['provider_name'];
    _providerUrl = json['provider_url'];
    _entity = json['entity'];
    _id = json['id'];
    _url = json['url'];
    _authorName = json['author_name'];
    _title = json['title'];
    _thumbnailUrl = json['thumbnail_url'];
    _thumbnailWidth = json['thumbnail_width'];
    _thumbnailHeight = json['thumbnail_height'];
    _width = json['width'];
    _height = json['height'];
    _html = json['html'];
  }
  String? _version;
  String? _type;
  int? _cacheAge;
  String? _providerName;
  String? _providerUrl;
  String? _entity;
  int? _id;
  String? _url;
  String? _authorName;
  String? _title;
  String? _thumbnailUrl;
  int? _thumbnailWidth;
  int? _thumbnailHeight;
  int? _width;
  int? _height;
  String? _html;

  String? get version => _version;
  String? get type => _type;
  int? get cacheAge => _cacheAge;
  String? get providerName => _providerName;
  String? get providerUrl => _providerUrl;
  String? get entity => _entity;
  int? get id => _id;
  String? get url => _url;
  String? get authorName => _authorName;
  String? get title => _title;
  String? get thumbnailUrl => _thumbnailUrl;
  int? get thumbnailWidth => _thumbnailWidth;
  int? get thumbnailHeight => _thumbnailHeight;
  int? get width => _width;
  int? get height => _height;
  String? get html => _html;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = _version;
    map['type'] = _type;
    map['cache_age'] = _cacheAge;
    map['provider_name'] = _providerName;
    map['provider_url'] = _providerUrl;
    map['entity'] = _entity;
    map['id'] = _id;
    map['url'] = _url;
    map['author_name'] = _authorName;
    map['title'] = _title;
    map['thumbnail_url'] = _thumbnailUrl;
    map['thumbnail_width'] = _thumbnailWidth;
    map['thumbnail_height'] = _thumbnailHeight;
    map['width'] = _width;
    map['height'] = _height;
    map['html'] = _html;
    return map;
  }

}