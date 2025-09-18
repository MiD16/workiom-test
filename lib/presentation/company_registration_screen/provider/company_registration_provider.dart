import 'package:flutter/material.dart';
import '../models/company_registration_model.dart';

class CompanyRegistrationProvider extends ChangeNotifier {
  CompanyRegistrationModel companyRegistrationModel =
      CompanyRegistrationModel();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    companyNameController.dispose();
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

    companyRegistrationModel.companyName = companyNameController.text;
    companyRegistrationModel.teamName = teamNameController.text;
    companyRegistrationModel.firstName = firstNameController.text;
    companyRegistrationModel.lastName = lastNameController.text;

    // Clear form fields after successful creation
    companyNameController.clear();
    teamNameController.clear();
    firstNameController.clear();
    lastNameController.clear();

    isLoading = false;
    notifyListeners();
  }
}
