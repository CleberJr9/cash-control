sealed class AuthState {
  const AuthState();
}

final class AuthStateSuccess extends AuthState {
  final String accessToken;
  final String nameUser;

  const AuthStateSuccess({required this.accessToken, required this.nameUser});
}

final class AuthStateError extends AuthState {
  final String error;

  const AuthStateError({required this.error});
}

final class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

final class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}
