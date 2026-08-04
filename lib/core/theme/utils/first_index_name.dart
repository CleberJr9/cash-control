String firstIndexName(String? name) {
  if (name == null || name.isEmpty) {
    return '';
  }
  return name.substring(0, 1).toUpperCase();
}
