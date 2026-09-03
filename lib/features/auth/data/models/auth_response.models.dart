class AuthResponseModels {
  final String accessToken;
  final String nameUser;
  const AuthResponseModels({required this.accessToken, required this.nameUser});
  factory AuthResponseModels.fromJson(Map<String, dynamic> json) {
    return AuthResponseModels(
      accessToken: json['accessToken'] as String,
      nameUser: json['nameUser'] as String,
    );
  }
}
