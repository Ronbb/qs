import 'package:qs/src/utils.dart';

import 'query_parameters_map.dart';

/// Encoder
class Encoder {
  /// Create a new [Encoder].
  Encoder();

  /// Encode [src].
  ///
  /// Type of [src] should be one of Map<String, dynamic>,
  /// List<Map<String, dynamic>> or String.
  String encode(Object src) {
    final m = _transform(src);
    return m.toString();
  }

  QueryParametersMap _transformMap(
    Map<String, dynamic> src, {
    String? parentKey,
  }) {
    final map = QueryParametersMap();
    src.forEach((childKey, childValue) {
      final combinedKey = _combineKey(childKey, parentKey: parentKey);
      final transformedValue = _transform(childValue, parentKey: combinedKey);

      var valueList = map[combinedKey];
      if (transformedValue is String) {
        valueList.add(transformedValue);
      }
      if (transformedValue is QueryParametersMap) {
        map.merge(transformedValue);
      }
    });
    return map;
  }

  String _combineKey(String key, {String? parentKey}) {
    final encodedKey = key.toSnakeCase();
    var k = parentKey == null ? encodedKey : '$parentKey.$encodedKey';
    return k;
  }

  QueryParametersMap _transformList(List src, {String? parentKey}) {
    final map = QueryParametersMap();
    if (src.isEmpty) {
      return map;
    }

    for (var i = 0; i < src.length; i++) {
      final combinedKey = _combineKey(i.toString(), parentKey: parentKey);
      var transformedValue = _transform(src[i], parentKey: combinedKey);
      if (transformedValue is String) {
        map[parentKey ?? combinedKey].add(transformedValue);
      }
      if (transformedValue is QueryParametersMap) {
        map.merge(transformedValue);
      }
    }

    return map;
  }

  dynamic _transform(dynamic src, {String? parentKey}) {
    if (src is Map<String, dynamic>) {
      return _transformMap(src, parentKey: parentKey);
    }
    if (src is List) {
      return _transformList(src, parentKey: parentKey);
    }

    return src.toString();
  }
}
