import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workiom/data/models/responses/editions_response.dart';
import 'package:workiom/data/models/responses/password_complexity_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/models/requests/is_tenant_available_request.dart';
import '../../data/models/requests/register_tenant_request.dart';
import '../../data/models/requests/authenticate_request.dart';

class SignupController extends ChangeNotifier {
  final AuthRepository repository;

  bool loading = false;
  String? error;
  EditionsForSelectResponse? editions;
  PasswordComplexityResponse? passwordComplexity;

  SignupController({required this.repository});

  Future<void> fetchEditions() async {
    loading = true;
    notifyListeners();
    try {
      final resp = await repository.getEditionsForSelect();
      editions = resp.result;
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPasswordComplexity() async {
    loading = true;
    notifyListeners();
    try {
      final resp = await repository.getPasswordComplexitySetting();
      passwordComplexity = resp.result;
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<bool> checkTenantAvailability(String tenancyName) async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      final resp = await repository.isTenantAvailable(IsTenantAvailableRequest(tenancyName: tenancyName));
      final result = resp.result;
      final tenantId = result != null ? result['tenantId'] : null;
      return tenantId == null;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> registerTenantAndLogin({
    required String adminEmail,
    required String adminFirstName,
    required String adminLastName,
    required String adminPassword,
    required String editionId,
    required String tenantName,
    required String timeZone,
  }) async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      final request = RegisterTenantRequest(
        adminEmailAddress: adminEmail,
        adminFirstName: adminFirstName,
        adminLastName: adminLastName,
        adminPassword: adminPassword,
        editionId: editionId.isEmpty ? null : int.tryParse(editionId),
        name: tenantName,
        tenancyName: tenantName,
      );
      await repository.registerTenant(request, timeZone: timeZone);

      final authRequest = AuthenticateRequest(
        ianaTimeZone: timeZone,
        password: adminPassword,
        tenantName: tenantName,
        userNameOrEmailAddress: adminEmail,
      );
      await repository.authenticate(authRequest);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  TextEditingController teamNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    teamNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void initialize() {
    isLoading = false;
    notifyListeners();
  }

  String? validateCompanyName(String? value) {
    if (value?.isEmpty == true) {
      return 'Company name is required';
    }
    return null;
  }

  String? validateTeamName(String? value) {
    if (value?.isEmpty == true) {
      return 'Team name is required';
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value?.isEmpty == true) {
      return 'First name is required';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value?.isEmpty == true) {
      return 'Last name is required';
    }
    return null;
  }

  void createWorkspace() {
    isLoading = true;
    notifyListeners();
    
    teamNameController.clear();
    firstNameController.clear();
    lastNameController.clear();

    isLoading = false;
    notifyListeners();
  }
}