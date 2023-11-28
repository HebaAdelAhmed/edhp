class ValidateOrganizationMemberModel {
  SubscriptionInfoDTO? subscriptionInfoDTO;
  Result? result;

  ValidateOrganizationMemberModel({this.subscriptionInfoDTO, this.result});

  ValidateOrganizationMemberModel.fromJson(Map<String, dynamic> json) {
    subscriptionInfoDTO = json['SubscriptionInfoDTO'] != null
        ? SubscriptionInfoDTO.fromJson(json['SubscriptionInfoDTO'])
        : null;
    result =
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subscriptionInfoDTO != null) {
      data['SubscriptionInfoDTO'] = subscriptionInfoDTO!.toJson();
    }
    if (result != null) {
      data['Result'] = result!.toJson();
    }
    return data;
  }
}

class SubscriptionInfoDTO {
  int? subscriptionTypeID;
  int? organizationID;
  int? membershipTypeID;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  int? discountPercentage;
  int? organizationMembershipNumber;
  String? profileName;
  int? gender;
  String? identityNumber;
  String? mobileNumber;
  String? email;

  SubscriptionInfoDTO(
      {this.subscriptionTypeID,
        this.organizationID,
        this.membershipTypeID,
        this.subscriptionStartDate,
        this.subscriptionEndDate,
        this.discountPercentage,
        this.organizationMembershipNumber,
        this.profileName,
        this.gender,
        this.identityNumber,
        this.mobileNumber,
        this.email});

  SubscriptionInfoDTO.fromJson(Map<String, dynamic> json) {
    subscriptionTypeID = json['SubscriptionTypeID'];
    organizationID = json['OrganizationID'];
    membershipTypeID = json['MembershipTypeID'];
    subscriptionStartDate = json['SubscriptionStartDate'];
    subscriptionEndDate = json['SubscriptionEndDate'];
    discountPercentage = json['DiscountPercentage'];
    organizationMembershipNumber = json['OrganizationMembershipNumber'];
    profileName = json['ProfileName'];
    gender = json['Gender'];
    identityNumber = json['IdentityNumber'];
    mobileNumber = json['MobileNumber'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SubscriptionTypeID'] = subscriptionTypeID;
    data['OrganizationID'] = organizationID;
    data['MembershipTypeID'] = membershipTypeID;
    data['SubscriptionStartDate'] = subscriptionStartDate;
    data['SubscriptionEndDate'] = subscriptionEndDate;
    data['DiscountPercentage'] = discountPercentage;
    data['OrganizationMembershipNumber'] = organizationMembershipNumber;
    data['ProfileName'] = profileName;
    data['Gender'] = gender;
    data['IdentityNumber'] = identityNumber;
    data['MobileNumber'] = mobileNumber;
    data['Email'] = email;
    return data;
  }
}

class Result {
  int? iD;
  int? resultType;
  String? message;
  bool? isSuccess;
  bool? isFailed;

  Result(
      {this.iD, this.resultType, this.message, this.isSuccess, this.isFailed});

  Result.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    resultType = json['ResultType'];
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    isFailed = json['IsFailed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['ResultType'] = resultType;
    data['Message'] = message;
    data['IsSuccess'] = isSuccess;
    data['IsFailed'] = isFailed;
    return data;
  }
}