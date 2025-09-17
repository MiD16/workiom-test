import '../../data/models/responses/current_login_info_response.dart';
import '../../data/models/responses/editions_response.dart';
import '../../data/models/responses/password_complexity_response.dart';
import '../../data/models/responses/tenant_available_response.dart';
import '../../data/models/responses/authenticate_response.dart';
import '../../data/models/requests/register_tenant_request.dart';
import '../../data/models/requests/is_tenant_available_request.dart';
import '../../data/models/requests/authenticate_request.dart';

abstract class AuthRepository {

  Future<CurrentLoginInfoResponse> getCurrentLoginInformations();

  Future<EditionsForSelectResponse> getEditionsForSelect();

  Future<PasswordComplexityResponse> getPasswordComplexitySetting();

  Future<IsTenantAvailableResponse> isTenantAvailable(IsTenantAvailableRequest request);

  Future<void> registerTenant(RegisterTenantRequest request, {required String timeZone});

  Future<AuthenticateResponse> authenticate(AuthenticateRequest request);

}