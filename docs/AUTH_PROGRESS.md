# Auth — onde paramos

Snapshot do estado da feature `lib/features/auth/` em 2026-09-03, para retomar depois.

## Estrutura atual

```
lib/features/auth/
├── application/
│   └── auth_state.dart          # classe vazia — ainda não iniciado
├── data/
│   ├── models/
│   │   ├── auth_login.models.dart      # request (email, password)
│   │   └── auth_response.models.dart   # response (accessToken, nameUser)
│   └── repositories/
│       └── auth.repository.dart        # AuthRepository.login() + authRepositoryProvider
└── presentation/
    ├── pages/
    │   └── login.dart               # LoginState alterna login/register/reset via enum local
    └── widgets/
        ├── login_form.dart
        ├── register_form.dart
        └── reset_password.dart
```

Infra de suporte já criada fora da feature:
- `lib/core/http/dio_client.dart` — `Dio` configurado com `Env.apiUrl`, exposto via `dioProvider` (Riverpod).
- `lib/core/storage/secure_storage.dart` — wrapper de `flutter_secure_storage` (save/read/delete).
- `lib/core/config/env.dart` — lê `API_URL` do `.env`.

## O que já funciona

- **Modelos de login**: `AuthLoginModels` (toJson) e `AuthResponseModels` (fromJson) prontos e coerentes com um endpoint `POST /auth/login`.
- **AuthRepository**: método `login()` já chama `_dio.post('/auth/login', ...)` e desserializa a resposta. Está exposto como Riverpod `Provider` (`authRepositoryProvider`), injetando o `Dio` do `dioProvider`.
- **UI dos 3 fluxos** (login / cadastro / recuperar senha) está com layout pronto, incluindo validações de formulário client-side:
  - `login_form.dart`: valida email e senha (apenas "não vazio").
  - `register_form.dart`: valida nome, email, senha forte (8+ chars, maiúscula, minúscula, número, especial) e confirmação de senha.
  - `reset_password.dart`: valida email.
- Navegação entre os três estados é feita localmente em `LoginState` (`login.dart`) via `setState` + enum, sem rotas nomeadas.

## O que falta / está incompleto

1. **`AuthState` está vazia** (`application/auth_state.dart` tem só `class AuthState {}`). Não existe ainda:
   - Um `Notifier`/`StateNotifier` Riverpod que use `authRepositoryProvider`.
   - Estados de loading/erro/sucesso do login (hoje não há nenhum feedback de "carregando" ou "erro" na tela).

2. **Os formulários não chamam o `AuthRepository`.** Tanto `login_form.dart` (linha ~137-144) quanto `register_form.dart` (linha ~237-243) navegam direto para `Home()` só validando o formulário local — não fazem requisição nenhuma. `reset_password.dart` só dá `print('Enviar email')`.

3. **Sem persistência de sessão.** `SecureStorage` existe mas não é usado em lugar nenhum — o `accessToken` retornado por `AuthResponseModels` não é salvo, nem lido para decidir se o usuário já está logado ao abrir o app (`main.dart` sempre abre em `Login()`).

4. **Sem repository/endpoints de registro e reset de senha.** `AuthRepository` só tem `login()`. Não há `register()` nem `resetPassword()`, nem os `models` de request/response para esses fluxos.

5. **`DioClient` não anexa o token nas próximas requisições.** Não há `Interceptor` lendo o token salvo e adicionando `Authorization: Bearer ...` nas chamadas autenticadas.

6. **Sem tratamento de erro de rede/API.** Nenhum dos formulários trata `DioException` (ex.: credenciais inválidas, timeout, 500).

## Sugestão de próximos passos (na ordem)

1. Modelar o `AuthState` (ex.: `sealed class`/`freezed` com `initial`, `loading`, `authenticated(user)`, `error(message)`).
2. Criar um `AuthNotifier` (Riverpod `Notifier`/`AsyncNotifier`) que chama `authRepositoryProvider.login()` e expõe esse `AuthState`.
3. Ligar `login_form.dart` ao notifier: `onPressed` chama o notifier em vez de navegar direto; a tela reage ao estado (loading no botão, mensagem de erro, navegação para `Home` só em caso de sucesso).
4. Persistir o `accessToken` no `SecureStorage` após login bem-sucedido.
5. Repetir o padrão para registro e reset de senha (repository methods + ligação na UI).
6. Adicionar `Interceptor` no `DioClient` para anexar o token e, futuramente, tratar 401 (logout automático).

## Observação avulsa (não é sobre auth)

Em `register_form.dart`, o checkbox `_check` ("Concordo com os Termos") nunca é validado no `onPressed` — hoje dá pra criar conta mesmo desmarcado. Vale revisar quando voltar nessa tela.
