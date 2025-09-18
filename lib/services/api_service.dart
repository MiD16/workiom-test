import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:timezone/timezone.dart' as tz;
import '../models/api_models.dart';

class ApiService {
  static const String baseUrl = 'https://api.workiom.club';
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  
  late final Dio _dio;
  
  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ));
    
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.read(key: 'auth_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));
  }

  Future<LoginInformationResponse> getCurrentLoginInformation() async {
    final response = await _dio.get('/api/services/app/Session/GetCurrentLoginInformations');
    return LoginInformationResponse.fromJson(response.data);
  }

  Future<EditionsResponse> getEditionsForSelect() async {
    final response = await _dio.get('/api/services/app/TenantRegistration/GetEditionsForSelect');
    return EditionsResponse.fromJson(response.data);
  }

  Future<PasswordComplexityResponse> getPasswordComplexitySetting() async {
    final response = await _dio.get('/api/services/app/Profile/GetPasswordComplexitySetting');
    return PasswordComplexityResponse.fromJson(response.data);
  }

  Future<TenantAvailabilityResponse> isTenantAvailable(String tenancyName) async {
    final response = await _dio.post(
      '/api/services/app/Account/IsTenantAvailable',
      data: {'tenancyName': tenancyName},
    );
    return TenantAvailabilityResponse.fromJson(response.data);
  }

  Future<void> registerTenant(RegisterTenantRequest request) async {
    final timeZone = tz.local.name;
    await _dio.post(
      '/api/services/app/TenantRegistration/RegisterTenant',
      queryParameters: {'timeZone': timeZone},
      data: request.toJson(),
    );
  }

  Future<AuthenticationResponse> authenticate(AuthenticationRequest request) async {
    final response = await _dio.post('/api/TokenAuth/Authenticate', data: request.toJson());
    final authResponse = AuthenticationResponse.fromJson(response.data);
    
    if (authResponse.accessToken != null) {
      await _storage.write(key: 'auth_token', value: authResponse.accessToken);
    }
    
    return authResponse;
  }
}