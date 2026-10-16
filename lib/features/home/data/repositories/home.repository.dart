import 'package:cash_control/core/http/dio_client.dart';
import 'package:cash_control/features/home/data/models/home_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRepository {
  final Dio _dio;
  const HomeRepository(this._dio);
  Future<HomeModels> getHome() async {
    final response = await _dio.get('/home');
    return HomeResponseModels.fromJson(response.data).data;
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref.watch(dioProvider));
});
