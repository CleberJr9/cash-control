enum FilterPeriod {
  month,
  week,
  day;

  String get label => switch (this) {
    FilterPeriod.month => "Mês",
    FilterPeriod.week => "semana",
    FilterPeriod.day => "dia",
  };
}
