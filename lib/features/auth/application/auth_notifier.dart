import 'package:cash_control/core/storage/secure_storage.dart';
import 'package:cash_control/core/theme/enums/storage_key_enum.dart';
import 'package:cash_control/features/auth/application/auth_state.dart';
import 'package:cash_control/features/auth/data/models/auth_login.models.dart';
import 'package:cash_control/features/auth/data/models/auth_response.models.dart';
import 'package:cash_control/features/auth/data/repositories/auth.repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthStateInitial();
  }

  Future<void> login(String email, String password) async {
    final AuthLoginModels credentials = AuthLoginModels(
      email: email,
      password: password,
    );
    state = const AuthStateLoading();
    try {
      final AuthResponseModels response = await ref
          .read(authRepositoryProvider)
          .login(credentials);
      await ref
          .read(secureStorageProvider)
          .save(StorageKeyEnum.accessToken.name, response.accessToken);
      await ref
          .read(secureStorageProvider)
          .save(StorageKeyEnum.nameUser.name, response.nameUser);
      state = AuthStateSuccess(
        accessToken: response.accessToken,
        nameUser: response.nameUser,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        state = const AuthStateError(
          error: 'Verifique sua conexão com a internet.',
        );

        return;
      }
      final statusCode = e.response?.statusCode;
      switch (statusCode) {
        case 401:
          state = AuthStateError(error: 'Email ou senha inválidos');
          break;
        case 404:
          state = AuthStateError(
            error: 'Serviço de autenticação não encontrado.',
          );
        default:
          state = AuthStateError(error: 'Erro ao tentar fazer login');
      }
    } catch (_) {
      state = AuthStateError(error: 'Erro ao tentar fazer login');
    }
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
