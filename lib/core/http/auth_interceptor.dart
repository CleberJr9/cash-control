import 'package:cash_control/core/storage/secure_storage.dart';
import 'package:cash_control/core/theme/enums/storage_key_enum.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Future<void> Function() _onLogout;
  final SecureStorage _storage;
  AuthInterceptor(this._storage, this._onLogout);

  static const _authRoutes = ['/auth/login', '/auth/register'];

  bool _isAuthRoute(String path) {
    return _authRoutes.contains(path);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAuthRoute(options.path)) {
      handler.next(options);
      return;
    }

    try {
      final token = await _storage.read(StorageKeyEnum.accessToken);

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {
      // Se não conseguir ler o token,
      // a requisição segue sem Authorization.
    } finally {
      handler.next(options);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isAuthRoute = _isAuthRoute(err.requestOptions.path);

    if (!isAuthRoute && err.response?.statusCode == 401) {
      try {
        await _onLogout();
      } catch (_) {
      } finally {
        handler.next(err);
      }

      return;
    }

    handler.next(err);
  }
}
