import 'package:cash_control/core/http/dio_client.dart';
import 'package:cash_control/features/auth/data/models/auth_login.models.dart';
import 'package:cash_control/features/auth/data/models/auth_response.models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final Dio _dio;
  AuthRepository(this._dio);

  Future<AuthResponseModels> login(AuthLoginModels credentials) async {
    final response = await _dio.post('auth/login', data: credentials.toJson());
    return AuthResponseModels.fromJson(response.data['data']);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(dioProvider));
});
