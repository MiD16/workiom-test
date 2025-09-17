import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workiom/data/data_sources/remote_data_source.dart';
import 'package:workiom/data/repositories/auth_repository_implementation.dart';
import 'package:workiom/theme/theme_helper.dart';
import 'core/token_storage.dart';
import 'core/api_client.dart';
import 'domain/repositories/auth_repository.dart';
import 'presentation/controllers/auth_controller.dart';
import 'presentation/controllers/signup_controller.dart';
import 'presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenStorage = TokenStorage();
    final apiClient = ApiClient(tokenStorage);
    final remote = RemoteDataSource(apiClient);
    final authRepo = AuthRepositoryImpl(remote: remote, tokenStorage: tokenStorage);

    return MultiProvider(
      providers: [
        Provider<TokenStorage>.value(value: tokenStorage),
        Provider<ApiClient>.value(value: apiClient),
        Provider<RemoteDataSource>.value(value: remote),
        Provider<AuthRepository>.value(value: authRepo),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(repository: authRepo, tokenStorage: tokenStorage),
        ),
        ChangeNotifierProvider<SignupController>(
          create: (_) => SignupController(repository: authRepo),
        ),
      ],
      child: MaterialApp(
        title: 'Workiom Flutter Test',
        theme: ThemeHelper().themeData(),
        home: const SplashPage(),
      ),
    );
  }
}