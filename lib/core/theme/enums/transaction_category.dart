// lib/core/enums/transaction_category.dart

import 'package:flutter/material.dart';

enum TransactionCategory {
  alimentacao,
  transporte,
  moradia,
  lazer,
  compras,
  saude;

  String get label => switch (this) {
    TransactionCategory.alimentacao => 'Alimentação',
    TransactionCategory.transporte => 'Transporte',
    TransactionCategory.moradia => 'Moradia',
    TransactionCategory.lazer => 'Lazer',
    TransactionCategory.compras => 'Compras',
    TransactionCategory.saude => 'Saúde',
  };

  String get sigla => switch (this) {
    TransactionCategory.alimentacao => 'Al',
    TransactionCategory.transporte => 'Tr',
    TransactionCategory.moradia => 'Mo',
    TransactionCategory.lazer => 'La',
    TransactionCategory.compras => 'Co',
    TransactionCategory.saude => 'Sa',
  };

  Color get color => switch (this) {
    TransactionCategory.alimentacao => const Color(0xFFE0892F),
    TransactionCategory.transporte => const Color(0xFF2E78C7),
    TransactionCategory.moradia => const Color(0xFF7A5AD9),
    TransactionCategory.lazer => const Color(0xFF2E9E73),
    TransactionCategory.compras => const Color(0xFFC9483B),
    TransactionCategory.saude => const Color(0xFF18A0A0),
  };

  static TransactionCategory fromKey(String key) {
    return TransactionCategory.values.firstWhere(
      (e) => e.name == key,
      orElse: () => throw ArgumentError('Categoria inválida: $key'),
    );
  }
}
