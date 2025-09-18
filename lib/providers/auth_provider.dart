import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import '../core/app_export.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  bool _isLoading = false;
  bool _isLoggedIn = false;
  User? _currentUser;
  Tenant? _currentTenant;
  Edition? _selectedEdition;
  PasswordComplexityResponse? _passwordComplexity;
  
  // Registration data
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _tenantName;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  User? get currentUser => _currentUser;
  Tenant? get currentTenant => _currentTenant;
  Edition? get selectedEdition => _selectedEdition;
  PasswordComplexityResponse? get passwordComplexity => _passwordComplexity;

  Future<void> checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      final loginInfo = await _apiService.getCurrentLoginInformation();
      _currentUser = loginInfo.user;
      _currentTenant = loginInfo.tenant;
      _isLoggedIn = _currentUser != null;
      
      if (_isLoggedIn) {
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.thankYouScreen, (route) => false);
      } else {
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.accountRegistrationScreen, (route) => false);
      }
    } catch (e) {
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.accountRegistrationScreen, (route) => false);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadEditions() async {
    try {
      final editionsResponse = await _apiService.getEditionsForSelect();
      if (editionsResponse.editionsWithFeatures.isNotEmpty) {
        _selectedEdition = editionsResponse.editionsWithFeatures.first;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading editions: $e');
    }
  }

  Future<void> loadPasswordComplexity() async {
    try {
      _passwordComplexity = await _apiService.getPasswordComplexitySetting();
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading password complexity: $e');
    }
  }

  String? validatePassword(String? password) {
    if (password?.isEmpty ?? true) return 'Password is required';
    if (_passwordComplexity == null) return null;

    final complexity = _passwordComplexity!;
    
    if (password!.length < complexity.requiredLength) {
      return 'Password must have at least ${complexity.requiredLength} characters';
    }
    
    if (complexity.requireUppercase && !RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must have at least one uppercase letter';
    }
    
    if (complexity.requireLowercase && !RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must have at least one lowercase letter';
    }
    
    if (complexity.requireDigit && !RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must have at least one digit';
    }
    
    if (complexity.requireNonAlphanumeric && !RegExp(r'[^a-zA-Z0-9]').hasMatch(password)) {
      return 'Password must have at least one special character';
    }
    
    return null;
  }

  String? validateTenantName(String? tenantName) {
    if (tenantName?.isEmpty ?? true) return 'Tenant name is required';
    if (!RegExp(r'^[a-zA-Z][a-zA-Z0-9-]*$').hasMatch(tenantName!)) {
      return 'Tenant name must start with a letter and contain only letters, numbers, and dashes';
    }
    return null;
  }

  String? validateName(String? name) {
    if (name?.isEmpty ?? true) return 'Name is required';
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name!)) {
      return 'Name must contain only letters';
    }
    return null;
  }

  Future<bool> checkTenantAvailability(String tenantName) async {
    try {
      final response = await _apiService.isTenantAvailable(tenantName);
      return response.tenantId == null;
    } catch (e) {
      return false;
    }
  }

  void setRegistrationData({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? tenantName,
  }) {
    if (email != null) _email = email;
    if (password != null) _password = password;
    if (firstName != null) _firstName = firstName;
    if (lastName != null) _lastName = lastName;
    if (tenantName != null) _tenantName = tenantName;
  }

  Future<bool> registerAndLogin() async {
    if (_email == null || _password == null || _firstName == null || 
        _lastName == null || _tenantName == null || _selectedEdition == null) {
      return false;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final registerRequest = RegisterTenantRequest(
        adminEmailAddress: _email!,
        adminFirstName: _firstName!,
        adminLastName: _lastName!,
        adminPassword: _password!,
        editionId: _selectedEdition!.id,
        name: _tenantName!,
        tenancyName: _tenantName!,
      );

      await _apiService.registerTenant(registerRequest);

      // Login user
      final authRequest = AuthenticationRequest(
        ianaTimeZone: tz.local.name,
        password: _password!,
        rememberClient: false,
        singleSignIn: false,
        tenantName: _tenantName!,
        userNameOrEmailAddress: _email!,
      );

      await _apiService.authenticate(authRequest);

      // Get login information
      final loginInfo = await _apiService.getCurrentLoginInformation();
      _currentUser = loginInfo.user;
      _currentTenant = loginInfo.tenant;
      _isLoggedIn = true;

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Registration error: $e');
      return false;
    }
  }
}