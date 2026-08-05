String firstIndexName(String? name) {
  if (name == null || name.isEmpty) {
    return '';
  }

  return ' ${name[0].toUpperCase()}${name.trim().split(' ')[1][0].toUpperCase()}';
}
