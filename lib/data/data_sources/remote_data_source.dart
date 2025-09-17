import 'package:dio/dio.dart';
import '../../core/api_client.dart';
import '../../core/exceptions.dart';
import '../models/responses/current_login_info_response.dart';
import '../models/responses/editions_response.dart';
import '../models/responses/password_complexity_response.dart';
import '../models/responses/tenant_available_response.dart';
import '../models/responses/authenticate_response.dart';
import '../models/requests/register_tenant_request.dart';
import '../models/requests/is_tenant_available_request.dart';
import '../models/requests/authenticate_request.dart';

class RemoteDataSource {
  final ApiClient client;

  RemoteDataSource(this.client);

  Future<CurrentLoginInfoResponse> getCurrentLoginInformations() async {

    try {

      final result = await client.dio.get('/api/services/app/Session/GetCurrentLoginInformations');
      return CurrentLoginInfoResponse.fromJson(result.data);

    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Something went wrong at getCurrentLoginInformations()');
    }
  }

  Future<EditionsForSelectResponse> getEditionsForSelect() async {

    try {

      final result = await client.dio.get('/api/services/app/TenantRegistration/GetEditionsForSelect');
      return EditionsForSelectResponse.fromJson(result.data);

    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Something went wrong at getEditionsForSelect()');
    }
  }

  Future<PasswordComplexityResponse> getPasswordComplexitySetting() async {

    try {

      final result = await client.dio.get('/api/services/app/Profile/GetPasswordComplexitySetting');
      return PasswordComplexityResponse.fromJson(result.data);

    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Something went wrong at getPasswordComplexitySetting()');
    }
  }

  Future<IsTenantAvailableResponse> isTenantAvailable(IsTenantAvailableRequest req) async {

    try {

      final result = await client.dio.post('/api/services/app/Account/IsTenantAvailable', data: req.toJson());
      return IsTenantAvailableResponse.fromJson(result.data);

    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Something went wrong at isTenantAvailable(I');
    }
  }

  Future<void> registerTenant(RegisterTenantRequest req, {required String timeZone}) async {

    try {

      final result = await client.dio.post('/api/services/app/TenantRegistration/RegisterTenant',
          data: {...req.toJson(), 'timeZone': timeZone});

      if (result.statusCode != 200 && result.statusCode != 204) {
        throw ServerException('Failed to register tenant');
      }

    } on DioException catch (e) {
      final msg = e.response?.data ?? e.message;
      throw ServerException(msg.toString());
    }
  }

  Future<AuthenticateResponse> authenticate(AuthenticateRequest req) async {

    try {

      final result = await client.dio.post('/api/TokenAuth/Authenticate', data: req.toJson());
      return AuthenticateResponse.fromJson(result.data);
      
    } on DioException catch (e) {
      throw ServerException(e.response?.data?['error'] ?? e.message);
    }
  }
}