class Comment {
  // TODO : integrate with firebase Auth
  final String _author;
  String _data;
  final DateTime _createdAt = DateTime.now();
  DateTime _updatedAt = DateTime.now();

  set data(String data) {
    _updatedAt = DateTime.now();
    _data = data;
  }

  String get author => _author;

  String get data => _data;

  DateTime get createdAt => _createdAt;

  DateTime get updatedAt => _updatedAt;

  Comment(this._author, this._data);
}
