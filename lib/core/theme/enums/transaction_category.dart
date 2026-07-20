// lib/core/enums/transaction_category.dart
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum TransactionCategory {
  FOOD,
  TRANSPORT,
  HOUSING,
  LEISURE,
  SHOPPING,
  HEALTH;

  String get label => switch (this) {
    TransactionCategory.FOOD => 'Alimentação',
    TransactionCategory.TRANSPORT => 'Transporte',
    TransactionCategory.HOUSING => 'Moradia',
    TransactionCategory.LEISURE => 'Lazer',
    TransactionCategory.SHOPPING => 'Compras',
    TransactionCategory.HEALTH => 'Saúde',
  };

  String get sigla => switch (this) {
    TransactionCategory.FOOD => 'Al',
    TransactionCategory.TRANSPORT => 'Tr',
    TransactionCategory.HOUSING => 'Mo',
    TransactionCategory.LEISURE => 'La',
    TransactionCategory.SHOPPING => 'Co',
    TransactionCategory.HEALTH => 'Sa',
  };

  Color get color => switch (this) {
    TransactionCategory.FOOD => const Color(0xFFE0892F),
    TransactionCategory.TRANSPORT => const Color(0xFF2E78C7),
    TransactionCategory.HOUSING => const Color(0xFF7A5AD9),
    TransactionCategory.LEISURE => const Color(0xFF2E9E73),
    TransactionCategory.SHOPPING => const Color(0xFFC9483B),
    TransactionCategory.HEALTH => const Color(0xFF18A0A0),
  };

  /// Converte a chave vinda da API (ex.: "FOOD") para o enum.
  static TransactionCategory fromKey(String key) {
    return TransactionCategory.values.firstWhere(
      (e) => e.name == key,
      orElse: () => throw ArgumentError('Categoria inválida: $key'),
    );
  }
}
