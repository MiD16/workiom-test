class LoginInformationResponse {
  final User? user;
  final Tenant? tenant;

  LoginInformationResponse({this.user, this.tenant});

  factory LoginInformationResponse.fromJson(Map<String, dynamic> json) {
    return LoginInformationResponse(
      user: json['result']?['user'] != null ? User.fromJson(json['result']['user']) : null,
      tenant: json['result']?['tenant'] != null ? Tenant.fromJson(json['result']['tenant']) : null,
    );
  }
}

class User {
  final int id;
  final String userName;
  final String emailAddress;

  User({required this.id, required this.userName, required this.emailAddress});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      emailAddress: json['emailAddress'],
    );
  }
}

class Tenant {
  final int id;
  final String name;
  final String tenancyName;

  Tenant({required this.id, required this.name, required this.tenancyName});

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      name: json['name'],
      tenancyName: json['tenancyName'],
    );
  }
}

class EditionsResponse {
  final List<Feature> allFeatures;
  final List<Edition> editionsWithFeatures;

  EditionsResponse({required this.allFeatures, required this.editionsWithFeatures});

  factory EditionsResponse.fromJson(Map<String, dynamic> json) {
    return EditionsResponse(
      allFeatures: (json['result']['allFeatures'] as List).map((e) => Feature.fromJson(e)).toList(),
      editionsWithFeatures: (json['result']['editionsWithFeatures'] as List).map((e) => Edition.fromJson(e)).toList(),
    );
  }
}

class Feature {
  final String name;
  final String displayName;

  Feature({required this.name, required this.displayName});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      name: json['name'],
      displayName: json['displayName'],
    );
  }
}

class Edition {
  final int id;
  final String displayName;
  final bool isRegistrable;
  final double? annualPrice;
  final double? monthlyPrice;
  final bool hasTrial;
  final bool isMostPopular;

  Edition({
    required this.id,
    required this.displayName,
    required this.isRegistrable,
    this.annualPrice,
    this.monthlyPrice,
    required this.hasTrial,
    required this.isMostPopular,
  });

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      id: json['id'],
      displayName: json['displayName'],
      isRegistrable: json['isRegistrable'],
      annualPrice: json['annualPrice']?.toDouble(),
      monthlyPrice: json['monthlyPrice']?.toDouble(),
      hasTrial: json['hasTrial'],
      isMostPopular: json['isMostPopular'],
    );
  }
}

class PasswordComplexityResponse {
  final bool requireDigit;
  final bool requireLowercase;
  final bool requireNonAlphanumeric;
  final bool requireUppercase;
  final int requiredLength;

  PasswordComplexityResponse({
    required this.requireDigit,
    required this.requireLowercase,
    required this.requireNonAlphanumeric,
    required this.requireUppercase,
    required this.requiredLength,
  });

  factory PasswordComplexityResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'];
    return PasswordComplexityResponse(
      requireDigit: result['requireDigit'],
      requireLowercase: result['requireLowercase'],
      requireNonAlphanumeric: result['requireNonAlphanumeric'],
      requireUppercase: result['requireUppercase'],
      requiredLength: result['requiredLength'],
    );
  }
}

class TenantAvailabilityResponse {
  final int? tenantId;

  TenantAvailabilityResponse({this.tenantId});

  factory TenantAvailabilityResponse.fromJson(Map<String, dynamic> json) {
    return TenantAvailabilityResponse(
      tenantId: json['result']?['tenantId'],
    );
  }
}

class RegisterTenantRequest {
  final String adminEmailAddress;
  final String adminFirstName;
  final String adminLastName;
  final String adminPassword;
  final String? captchaResponse;
  final int editionId;
  final String name;
  final String tenancyName;

  RegisterTenantRequest({
    required this.adminEmailAddress,
    required this.adminFirstName,
    required this.adminLastName,
    required this.adminPassword,
    this.captchaResponse,
    required this.editionId,
    required this.name,
    required this.tenancyName,
  });

  Map<String, dynamic> toJson() {
    return {
      'adminEmailAddress': adminEmailAddress,
      'adminFirstName': adminFirstName,
      'adminLastName': adminLastName,
      'adminPassword': adminPassword,
      'captchaResponse': captchaResponse,
      'editionId': editionId,
      'name': name,
      'tenancyName': tenancyName,
    };
  }
}

class AuthenticationRequest {
  final String ianaTimeZone;
  final String password;
  final bool rememberClient;
  final String? returnUrl;
  final bool singleSignIn;
  final String tenantName;
  final String userNameOrEmailAddress;

  AuthenticationRequest({
    required this.ianaTimeZone,
    required this.password,
    required this.rememberClient,
    this.returnUrl,
    required this.singleSignIn,
    required this.tenantName,
    required this.userNameOrEmailAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'ianaTimeZone': ianaTimeZone,
      'password': password,
      'rememberClient': rememberClient,
      'returnUrl': returnUrl,
      'singleSignIn': singleSignIn,
      'tenantName': tenantName,
      'userNameOrEmailAddress': userNameOrEmailAddress,
    };
  }
}

class AuthenticationResponse {
  final String? accessToken;
  final String? encryptedAccessToken;
  final int? expireInSeconds;
  final int? userId;

  AuthenticationResponse({
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.userId,
  });

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      accessToken: json['result']?['accessToken'],
      encryptedAccessToken: json['result']?['encryptedAccessToken'],
      expireInSeconds: json['result']?['expireInSeconds'],
      userId: json['result']?['userId'],
    );
  }
}