extension Case on String {
  String toSnakeCase() {
    return RegExp(r'([a-z]+)|([A-Z][a-z]*)|([0-9]+)')
        .allMatches(this)
        .map((e) => e[0]?.toLowerCase())
        .join('_');
  }

  String toCamelCase() {
    return splitMapJoin(
      RegExp(r'([a-z]+)|([A-Z][a-z]*)|([0-9]+)'),
      onMatch: (match) => '${match[0]?.upperFirst()}',
      onNonMatch: (str) => '',
    ).lowerFirst();
  }

  String upperFirst() {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String lowerFirst() {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toLowerCase()}${substring(1)}';
  }
}
