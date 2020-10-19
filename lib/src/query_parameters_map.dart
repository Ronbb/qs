/// Query parameters map
class QueryParametersMap {
  QueryParametersMap() : _m = <String, List<String>>{};
  final Map<String, List<String>> _m;

  List<String> operator [](String key) {
    var value = _m[key];
    if (value == null) {
      value = [];
      _m[key] = value;
    }

    return value;
  }

  void operator []=(String key, List<String> value) {
    _m[key] = value;
  }

  void forEach(void Function(String key, List<String> value) f) {
    _m.forEach(f);
  }

  void merge(QueryParametersMap map) {
    if (map._m.isEmpty) {
      return;
    }
    map.forEach((key, value) {
      this[key].addAll(value);
    });
  }

  @override
  String toString() {
    if (_m.isEmpty) {
      return '';
    }
    final sb = StringBuffer();
    _m.forEach((key, values) {
      values.forEach((value) {
        sb.write('&$key=$value');
      });
    });
    return sb.toString().substring(1);
  }
}
