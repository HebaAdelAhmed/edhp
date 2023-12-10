class GetSubscriptionInfoLookupsModel {
  List<GenderList>? genderList;
  List<States>? states;
  Result? result;

  GetSubscriptionInfoLookupsModel({this.genderList, this.states, this.result});

  GetSubscriptionInfoLookupsModel.fromJson(Map<String, dynamic> json) {
    if (json['GenderList'] != null) {
      genderList = <GenderList>[];
      json['GenderList'].forEach((v) {
        genderList!.add(GenderList.fromJson(v));
      });
    }
    if (json['States'] != null) {
      states = <States>[];
      json['States'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
    result =
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genderList != null) {
      data['GenderList'] = genderList!.map((v) => v.toJson()).toList();
    }
    if (states != null) {
      data['States'] = states!.map((v) => v.toJson()).toList();
    }
    if (result != null) {
      data['Result'] = result!.toJson();
    }
    return data;
  }
}

class GenderList {
  int? key;
  String? value;

  GenderList({this.key, this.value});

  GenderList.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Key'] = key;
    data['Value'] = value;
    return data;
  }
}

class States {
  int? iD;
  String? name;

  States({this.iD, this.name});

  States.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Name'] = name;
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