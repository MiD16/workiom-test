import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../providers/auth_provider.dart';
import '../models/company_registration_model.dart';

class CompanyRegistrationProvider extends ChangeNotifier {
  CompanyRegistrationModel companyRegistrationModel =
      CompanyRegistrationModel();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool isLoading = false;
  bool isFormValid = false;

  @override
  void dispose() {
    teamNameController.removeListener(_validateForm);
    firstNameController.removeListener(_validateForm);
    lastNameController.removeListener(_validateForm);
    companyNameController.dispose();
    teamNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void initialize() {
    isLoading = false;
    teamNameController.addListener(_validateForm);
    firstNameController.addListener(_validateForm);
    lastNameController.addListener(_validateForm);
    notifyListeners();
  }

  void _validateForm() {
    isFormValid = teamNameController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
    notifyListeners();
  }

  String? validateCompanyName(String? value) {
    if (value?.isEmpty == true) {
      return 'Company name is required';
    }
    return null;
  }

  String? validateTeamName(String? value, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return authProvider.validateTenantName(value);
  }

  String? validateFirstName(String? value, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return authProvider.validateName(value);
  }

  String? validateLastName(String? value, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return authProvider.validateName(value);
  }

  Future<void> createWorkspace(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    final isAvailable = await authProvider.checkTenantAvailability(teamNameController.text);
    if (!isAvailable) {
      isLoading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tenant name is already taken')),
        );
      }
      return;
    }

    authProvider.setRegistrationData(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      tenantName: teamNameController.text,
    );

    final success = await authProvider.registerAndLogin();
    
    isLoading = false;
    notifyListeners();
    
    if (success) {
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.thankYouScreen, (route) => false);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed. Please try again.')),
        );
      }
    }
  }
}
