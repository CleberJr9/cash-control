import 'package:cash_control/core/config/env.dart';
import 'package:cash_control/core/http/auth_interceptor.dart';
import 'package:cash_control/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  static Dio create(String baseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }
}

final dioProvider = Provider<Dio>((ref) {
  final dio = DioClient.create(Env.apiUrl);
  final storage = ref.read(secureStorageProvider);
  dio.interceptors.add(AuthInterceptor(storage));
  return dio;
});
