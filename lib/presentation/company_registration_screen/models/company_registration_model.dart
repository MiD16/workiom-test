// ignore_for_file: must_be_immutable
class CompanyRegistrationModel {
  CompanyRegistrationModel({
    this.companyName,
    this.teamName,
    this.firstName,
    this.lastName,
    this.id,
  }) {
    companyName = companyName ?? '';
    teamName = teamName ?? '';
    firstName = firstName ?? '';
    lastName = lastName ?? '';
    id = id ?? '';
  }

  String? companyName;
  String? teamName;
  String? firstName;
  String? lastName;
  String? id;
}
