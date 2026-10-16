import 'package:cash_control/features/home/data/models/home_model.dart';
import 'package:cash_control/features/home/data/repositories/home.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = FutureProvider.autoDispose<HomeModels>((ref) async {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return await homeRepository.getHome();
});
