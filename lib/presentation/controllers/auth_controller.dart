import 'package:flutter/foundation.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/models/requests/authenticate_request.dart';
import '../../data/models/responses/current_login_info_response.dart';
import '../../core/token_storage.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository repository;
  final TokenStorage tokenStorage;

  CurrentLoginInfoResponse? currentLoginInfo;
  bool loading = false;
  String? error;

  AuthController({required this.repository, required this.tokenStorage});

  Future<void> checkCurrentLogin() async {
    loading = true;
    notifyListeners();
    try {
      currentLoginInfo = await repository.getCurrentLoginInformations();
    } catch (e) {
      error = e.toString();
      currentLoginInfo = null;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> login({
    required String timezone,
    required String password,
    required String email,
    String? tenantName,
  }) async {
    loading = true;
    notifyListeners();
    try {
      final request = AuthenticateRequest(
        ianaTimeZone: timezone,
        password: password,
        tenantName: tenantName,
        userNameOrEmailAddress: email,
      );
      await repository.authenticate(request);
      await checkCurrentLogin();
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await tokenStorage.deleteToken();
    currentLoginInfo = null;
    notifyListeners();
  }
}