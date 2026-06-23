import 'package:intl/intl.dart';

String formatCurrency(int? valueInCents) {
  if (valueInCents == null) return '';
  final value = valueInCents / 100;
  return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
}
