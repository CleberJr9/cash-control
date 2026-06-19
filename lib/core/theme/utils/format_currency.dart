import 'package:intl/intl.dart';

String formatCurrency(int? valueInCents) {
  final value = (valueInCents ?? 0) / 100;
  return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
}
