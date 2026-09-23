# Auth — onde paramos

Snapshot da feature `lib/features/auth/` em **2026-09-23**.
Substitui o snapshot de 2026-09-03 (o fluxo de login agora está ligado ponta a ponta).

## Estado atual

```
lib/features/auth/
├── application/
│   ├── auth_state.dart          # sealed AuthState + 4 variantes
│   └── auth_notifier.dart       # AuthNotifier + authNotifierProvider
├── data/
│   ├── models/
│   │   ├── auth_login.models.dart      # request (email, password)
│   │   └── auth_response.models.dart   # response (accessToken, nameUser)
│   └── repositories/
│       └── auth.repository.dart        # login() + authRepositoryProvider
└── presentation/
    ├── pages/
    │   └── login.dart
    └── widgets/
        ├── login_form.dart      # LIGADO ao notifier
        ├── register_form.dart   # ainda solto
        └── reset_password.dart  # ainda solto
```

Infra de suporte:
- `lib/core/http/dio_client.dart` — `Dio` com `Env.apiUrl`, via `dioProvider`.
- `lib/core/storage/secure_storage.dart` — wrapper + `secureStorageProvider`.
- `lib/core/theme/enums/storage_key_enum.dart` — `StorageKeyEnum { accessToken, nameUser }`.
- `lib/core/config/env.dart` — lê `API_URL` do `.env`.

## O fluxo de login está completo

`login_form.dart` → `AuthNotifier.login()` → `AuthRepository.login()` → Dio → volta como `AuthState` → UI reage.

**`auth_state.dart`** — `sealed class AuthState` com `AuthStateInitial`, `AuthStateLoading`,
`AuthStateSuccess(accessToken, nameUser)` e `AuthStateError(error)`. Todos os campos
`required` e não-nuláveis.

**`auth_notifier.dart`** — `Notifier<AuthState>`, `build()` devolve `AuthStateInitial`.
`login(String email, String password)`:
1. emite `AuthStateLoading`
2. monta o `AuthLoginModels` e chama o repository
3. grava `accessToken` e `nameUser` no `SecureStorage` **antes** de emitir sucesso
4. emite `AuthStateSuccess`
5. `on DioException`: ramo de rede/timeout (`connectionTimeout`, `sendTimeout`,
   `receiveTimeout`, `connectionError`) → mensagem de conexão; depois `switch` por
   status (401 / 404 / default)
6. `catch (_)` genérico ao final

Propriedade importante: **todo caminho de saída pousa num estado terminal** — nenhum
deixa `AuthStateLoading` pendurado, o que impede o botão de travar girando.

**`login_form.dart`** — `ConsumerStatefulWidget` / `ConsumerState`.
- `ref.watch` no topo do `build` deriva `isLoading` e alimenta o `AppButton`
  (o componente já desabilita o `onPressed` e troca o label pelo spinner).
- `ref.listen` **dentro do `build`, antes do `return`** — `switch` exaustivo sobre as
  quatro variantes, **sem `default`**, com guarda `mounted` antes de tocar em `context`.
- Sucesso → `Navigator.pushReplacement` para `Home`. Erro → `SnackBar` com a mensagem
  já traduzida pelo notifier.
- Método `login()` extraído; o `onPressed` só o chama.

## Decisões tomadas (e por quê)

| Decisão | Motivo | Quando reabrir |
|---|---|---|
| `Notifier<AuthState>` em vez de `AsyncNotifier` | A sealed class já modela loading/erro; `AsyncValue<AuthState>` duplicaria os dois | Na restauração de sessão — `AsyncNotifier.build()` pode ser `async`, o que resolve a leitura do storage no boot de graça |
| Estado carrega `accessToken` + `nameUser` achatados, não o `AuthResponseModels` | `application/` não depende do formato do JSON; mudança de contrato da API morre na `data/` | Se o estado precisar de muitos campos do usuário |
| `login()` recebe `String email, String password` | `presentation/` não importa de `data/models/`; grafo fica `presentation → application → data` em linha reta | Se o `AuthLoginModels` ganhar campo que não vem de `TextEditingController` (deviceId, token FCM, versão do app) |
| Token gravado no storage **antes** de emitir sucesso | Quando a UI reage ao sucesso, a sessão já está persistida | — |
| `switch` sem `default` | Só sem `default` o compilador cobra exaustividade sobre a sealed class | — |
| Mensagens de erro traduzidas no notifier, não na UI | A `presentation/` não precisa conhecer `DioException`; `AuthStateError.error` já chega pronto pro `SnackBar` | — |

## O que falta

### 1. Testar em runtime (próximo passo imediato)
Nada disso foi executado ainda — só verificado estaticamente (`flutter analyze` limpo).
Com o Nest em `localhost:3000`:
- senha errada → esperado `Email ou senha inválidos`
  (se aparecer "Serviço de autenticação não encontrado", o 404 é a rota, não a credencial)
- servidor derrubado → esperado `Verifique sua conexão com a internet.`
- login válido → navega pra `Home`, sem voltar pro login com o botão voltar
- conferir que o token ficou gravado no storage

### 2. Interceptor no `DioClient`
Ler `StorageKeyEnum.accessToken.name` do storage e anexar `Authorization: Bearer ...`.
Tratar 401 com logout automático.

### 3. Restaurar sessão no arranque
`main.dart:23` ainda abre direto em `Login()`. A leitura do storage no boot é assíncrona —
é aqui que a escolha `Notifier` vs `AsyncNotifier` volta à mesa.

### 4. Registro e recuperação de senha
`AuthRepository` só tem `login()`. Faltam `register()` e `resetPassword()`, os models de
request/response, e ligar `register_form.dart` e `reset_password.dart` ao notifier.
Hoje o registro navega direto pra `Home` e o reset só dá `print`.
O padrão já está estabelecido pelo login — deve sair rápido.

### 5. Logout
Limpar o `SecureStorage` e voltar o estado para `AuthStateInitial`.

## Dívidas pequenas

- `storage_key_enum.dart` está em `core/theme/enums/`; chave de storage não tem relação
  com tema — o lugar natural é `core/storage/`.
- `auth.repository.dart` usa `'auth/login'` **sem** barra inicial. Funciona porque
  `API_URL` termina com `/`. O Dio faz concatenação de string, não resolução de URI
  (`options.dart:662`), então `'/auth/login'` funcionaria com e sem a barra final —
  é a forma mais robusta.
- A mensagem do `case 404` assume "rota não encontrada". Confirmar o que o Nest devolve
  para credencial inválida.
- `auth_notifier.dart` lê `secureStorageProvider` duas vezes seguidas (cosmético).
- Estilo de `break` dentro de `switch` inconsistente entre `auth_notifier.dart` e
  `login_form.dart` — em Dart 3 ele é desnecessário em casos não-vazios.
- `reset_password.dart:129` ainda tem `print`.
- `register_form.dart`: o checkbox `_check` ("Concordo com os Termos") nunca é validado
  no `onPressed` — dá pra criar conta com ele desmarcado.

## Commits

- `f68e39b` feat: add authState
- `bc9761d` feat: add notifier auth
- `login_form.dart` ainda **não commitado**
