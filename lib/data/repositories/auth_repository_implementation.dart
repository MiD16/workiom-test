import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../../core/token_storage.dart';
import '../models/responses/authenticate_response.dart';
import '../models/requests/authenticate_request.dart';
import '../models/requests/register_tenant_request.dart';
import '../models/requests/is_tenant_available_request.dart';
import '../models/responses/tenant_available_response.dart';
import '../models/responses/password_complexity_response.dart';
import '../models/responses/editions_response.dart';
import '../models/responses/current_login_info_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remote;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({required this.remote, required this.tokenStorage});

  @override
  Future<CurrentLoginInfoResponse> getCurrentLoginInformations() =>
      remote.getCurrentLoginInformations();

  @override
  Future<EditionsForSelectResponse> getEditionsForSelect() =>
      remote.getEditionsForSelect();

  @override
  Future<PasswordComplexityResponse> getPasswordComplexitySetting() =>
      remote.getPasswordComplexitySetting();

  @override
  Future<IsTenantAvailableResponse> isTenantAvailable(IsTenantAvailableRequest request) =>
      remote.isTenantAvailable(request);

  @override
  Future<void> registerTenant(RegisterTenantRequest request, {required String timeZone}) =>
      remote.registerTenant(request, timeZone: timeZone);

  @override
  Future<AuthenticateResponse> authenticate(AuthenticateRequest request) async {
    final response = await remote.authenticate(request);

    final token = response.result != null && response.result['accessToken'] != null
        ? response.result['accessToken'] as String
        : null;

    if (token != null) {
      await tokenStorage.saveToken(token);
    }

    return response;
  }
}