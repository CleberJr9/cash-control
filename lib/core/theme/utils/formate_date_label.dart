String formatDateLabel(DateTime? date) {
  if (date == null) return '';
  final now = DateTime.now();

  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);

  final difference = today.difference(target).inDays;

  if (difference == 0) {
    return 'HOJE';
  }

  if (difference == 1) {
    return 'ONTEM';
  }

  const months = [
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez',
  ];

  return '${date.day} ${months[date.month - 1]}';
}
