import 'package:intl/intl.dart';

String formatCurrency(int? valueInCents) {
  if (valueInCents == null) return '';
  return NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  ).format(valueInCents);
}
