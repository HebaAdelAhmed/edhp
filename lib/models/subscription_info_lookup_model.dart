/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class GenderList {
  int? key;
  String? value;

  GenderList({this.key, this.value});

  GenderList.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Key'] = key;
    data['Value'] = value;
    return data;
  }
}

class MembershipType {
  int? price;
  String? name;
  DateTime? creationTime;
  int? createdBy;
  DateTime? modificationTime;
  int? modifiedBy;
  bool? isDeleted;
  int? saasProfileId;
  int? iD;
  bool? isActive;

  MembershipType({this.price, this.name, this.creationTime, this.createdBy, this.modificationTime, this.modifiedBy, this.isDeleted, this.saasProfileId, this.iD, this.isActive});

  MembershipType.fromJson(Map<String, dynamic> json) {
    price = json['Price'];
    name = json['Name'];
    creationTime = json['CreationTime'];
    createdBy = json['CreatedBy'];
    modificationTime = json['ModificationTime'];
    modifiedBy = json['ModifiedBy'];
    isDeleted = json['IsDeleted'];
    saasProfileId = json['SaasProfileId'];
    iD = json['ID'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Price'] = price;
    data['Name'] = name;
    data['CreationTime'] = creationTime;
    data['CreatedBy'] = createdBy;
    data['ModificationTime'] = modificationTime;
    data['ModifiedBy'] = modifiedBy;
    data['IsDeleted'] = isDeleted;
    data['SaasProfileId'] = saasProfileId;
    data['ID'] = iD;
    data['IsActive'] = isActive;
    return data;
  }
}

class MembershipType2 {
  int? price;
  String? name;
  DateTime? creationTime;
  int? createdBy;
  DateTime? modificationTime;
  int? modifiedBy;
  bool? isDeleted;
  int? saasProfileId;
  int? iD;
  bool? isActive;

  MembershipType2({this.price, this.name, this.creationTime, this.createdBy, this.modificationTime, this.modifiedBy, this.isDeleted, this.saasProfileId, this.iD, this.isActive});

  MembershipType2.fromJson(Map<String, dynamic> json) {
    price = json['Price'];
    name = json['Name'];
    creationTime = json['CreationTime'];
    createdBy = json['CreatedBy'];
    modificationTime = json['ModificationTime'];
    modifiedBy = json['ModifiedBy'];
    isDeleted = json['IsDeleted'];
    saasProfileId = json['SaasProfileId'];
    iD = json['ID'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Price'] = price;
    data['Name'] = name;
    data['CreationTime'] = creationTime;
    data['CreatedBy'] = createdBy;
    data['ModificationTime'] = modificationTime;
    data['ModifiedBy'] = modifiedBy;
    data['IsDeleted'] = isDeleted;
    data['SaasProfileId'] = saasProfileId;
    data['ID'] = iD;
    data['IsActive'] = isActive;
    return data;
  }
}

class Organization {
  int? organizationTypeID;
  OrganizationType? organizationType;
  int? membershipTypeID;
  MembershipType? membershipType;
  DateTime? contractStartDate;
  DateTime? contractEndDate;
  int? membershipTypePrice;
  int? discountPercentage;
  String? name;
  DateTime? creationTime;
  int? createdBy;
  DateTime? modificationTime;
  int? modifiedBy;
  bool? isDeleted;
  int? saasProfileId;
  int? iD;
  bool? isActive;
  String? description;

  Organization({this.organizationTypeID, this.organizationType, this.membershipTypeID, this.membershipType, this.contractStartDate, this.contractEndDate, this.membershipTypePrice, this.discountPercentage, this.name, this.creationTime, this.createdBy, this.modificationTime, this.modifiedBy, this.isDeleted, this.saasProfileId, this.iD, this.isActive, this.description});

  Organization.fromJson(Map<String, dynamic> json) {
    organizationTypeID = json['OrganizationTypeID'];
    organizationType = json['OrganizationType'] != null ? OrganizationType?.fromJson(json['OrganizationType']) : null;
    membershipTypeID = json['MembershipTypeID'];
    membershipType = json['MembershipType'] != null ? MembershipType?.fromJson(json['MembershipType']) : null;
    contractStartDate = json['ContractStartDate'];
    contractEndDate = json['ContractEndDate'];
    membershipTypePrice = json['MembershipTypePrice'];
    discountPercentage = json['DiscountPercentage'];
    name = json['Name'];
    creationTime = json['CreationTime'];
    createdBy = json['CreatedBy'];
    modificationTime = json['ModificationTime'];
    modifiedBy = json['ModifiedBy'];
    isDeleted = json['IsDeleted'];
    saasProfileId = json['SaasProfileId'];
    iD = json['ID'];
    isActive = json['IsActive'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['OrganizationTypeID'] = organizationTypeID;
    data['OrganizationType'] = organizationType!.toJson();
    data['MembershipTypeID'] = membershipTypeID;
    data['MembershipType'] = membershipType!.toJson();
    data['ContractStartDate'] = contractStartDate;
    data['ContractEndDate'] = contractEndDate;
    data['MembershipTypePrice'] = membershipTypePrice;
    data['DiscountPercentage'] = discountPercentage;
    data['Name'] = name;
    data['CreationTime'] = creationTime;
    data['CreatedBy'] = createdBy;
    data['ModificationTime'] = modificationTime;
    data['ModifiedBy'] = modifiedBy;
    data['IsDeleted'] = isDeleted;
    data['SaasProfileId'] = saasProfileId;
    data['ID'] = iD;
    data['IsActive'] = isActive;
    data['Description'] = description;
    return data;
  }
}

class OrganizationType {
  String? name;
  DateTime? creationTime;
  int? createdBy;
  bool? isDeleted;
  int? saasProfileId;
  int? iD;
  bool? isActive;

  OrganizationType({this.name, this.creationTime, this.createdBy, this.isDeleted, this.saasProfileId, this.iD, this.isActive});

  OrganizationType.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    creationTime = json['CreationTime'];
    createdBy = json['CreatedBy'];
    isDeleted = json['IsDeleted'];
    saasProfileId = json['SaasProfileId'];
    iD = json['ID'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['CreationTime'] = creationTime;
    data['CreatedBy'] = createdBy;
    data['IsDeleted'] = isDeleted;
    data['SaasProfileId'] = saasProfileId;
    data['ID'] = iD;
    data['IsActive'] = isActive;
    return data;
  }
}

class GetSubscriptionInfoLookupsModel {
  List<Organization?>? organizations;
  List<MembershipType?>? membershipTypes;
  List<SubscriptionType?>? subscriptionTypes;
  List<GenderList?>? genderList;
  List<State?>? states;

  GetSubscriptionInfoLookupsModel({this.organizations, this.membershipTypes, this.subscriptionTypes, this.genderList, this.states});

  GetSubscriptionInfoLookupsModel.fromJson(Map<String, dynamic> json) {
    if (json['Organizations'] != null) {
      organizations = <Organization>[];
      json['Organizations'].forEach((v) {
        organizations!.add(Organization.fromJson(v));
      });
    }
    if (json['MembershipTypes'] != null) {
      membershipTypes = <MembershipType>[];
      json['MembershipTypes'].forEach((v) {
        membershipTypes!.add(MembershipType.fromJson(v));
      });
    }
    if (json['SubscriptionTypes'] != null) {
      subscriptionTypes = <SubscriptionType>[];
      json['SubscriptionTypes'].forEach((v) {
        subscriptionTypes!.add(SubscriptionType.fromJson(v));
      });
    }
    if (json['GenderList'] != null) {
      genderList = <GenderList>[];
      json['GenderList'].forEach((v) {
        genderList!.add(GenderList.fromJson(v));
      });
    }
    if (json['States'] != null) {
      states = <State>[];
      json['States'].forEach((v) {
        states!.add(State.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Organizations'] =Organization != null ? organizations!.map((v) => v?.toJson()).toList() : null;
    data['MembershipTypes'] =MembershipType != null ? membershipTypes!.map((v) => v?.toJson()).toList() : null;
    data['SubscriptionTypes'] =SubscriptionType != null ? subscriptionTypes!.map((v) => v?.toJson()).toList() : null;
    data['GenderList'] =GenderList != null ? genderList!.map((v) => v?.toJson()).toList() : null;
    data['States'] =State != null ? states!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class State {
  String? name;
  String? nativeName;
  int? iD;
  bool? isActive;

  State({this.name, this.nativeName, this.iD, this.isActive});

  State.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    nativeName = json['NativeName'];
    iD = json['ID'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['NativeName'] = nativeName;
    data['ID'] = iD;
    data['IsActive'] = isActive;
    return data;
  }
}

class SubscriptionType {
  String? name;
  DateTime? creationTime;
  int? createdBy;
  bool? isDeleted;
  int? saasProfileId;
  int? iD;
  bool? isActive;

  SubscriptionType({this.name, this.creationTime, this.createdBy, this.isDeleted, this.saasProfileId, this.iD, this.isActive});

  SubscriptionType.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    creationTime = json['CreationTime'];
    createdBy = json['CreatedBy'];
    isDeleted = json['IsDeleted'];
    saasProfileId = json['SaasProfileId'];
    iD = json['ID'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Name'] = name;
    data['CreationTime'] = creationTime;
    data['CreatedBy'] = createdBy;
    data['IsDeleted'] = isDeleted;
    data['SaasProfileId'] = saasProfileId;
    data['ID'] = iD;
    data['IsActive'] = isActive;
    return data;
  }
}

