String firstIndexName(String? name) {
  if (name == null || name.trim().isEmpty) {
    return '';
  }

  final names = name.trim().split(RegExp(r'\s+'));

  final firstName = names[0][0].toUpperCase();

  if (names.length == 1) {
    return firstName;
  }

  final secondName = names[1][0].toUpperCase();

  return '$firstName$secondName';
}
