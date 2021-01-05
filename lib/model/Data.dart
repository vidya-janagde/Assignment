class Data {
  List<Status> status;
  List<Details> details;
  Null lstDrAdditionCityDetails;
  Null lstDrAdditionHospitalDetails;

  Data(
      {this.status,
        this.details,
        this.lstDrAdditionCityDetails,
        this.lstDrAdditionHospitalDetails});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Status'] != null) {
      status = new List<Status>();
      json['Status'].forEach((v) {
        status.add(new Status.fromJson(v));
      });
    }
    if (json['Details'] != null) {
      details = new List<Details>();
      json['Details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    lstDrAdditionCityDetails = json['lstDrAdditionCityDetails'];
    lstDrAdditionHospitalDetails = json['lstDrAdditionHospitalDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['Status'] = this.status.map((v) => v.toJson()).toList();
    }
    if (this.details != null) {
      data['Details'] = this.details.map((v) => v.toJson()).toList();
    }
    data['lstDrAdditionCityDetails'] = this.lstDrAdditionCityDetails;
    data['lstDrAdditionHospitalDetails'] = this.lstDrAdditionHospitalDetails;
    return data;
  }
}

class StatusD {
  bool isValid;
  String message;

  StatusD({this.isValid, this.message});

  StatusD.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isValid'] = this.isValid;
    data['Message'] = this.message;
    return data;
  }
}

class Details {
  String varDrName;
  String varCategory;
  String varSpeciality;
  String varCity;
  String varReqDate;
  String varStatus;
  String varAppDate;
  String varLatestStatus;
  String varStatusUpdatedBy;
  String varEmpCode;
  String varEmpName;
  String varReqRemarks;
  String varAppRemarks;
  Null varMobileNo;
  String varDrReqCode;

  Details(
      {this.varDrName,
        this.varCategory,
        this.varSpeciality,
        this.varCity,
        this.varReqDate,
        this.varStatus,
        this.varAppDate,
        this.varLatestStatus,
        this.varStatusUpdatedBy,
        this.varEmpCode,
        this.varEmpName,
        this.varReqRemarks,
        this.varAppRemarks,
        this.varMobileNo,
        this.varDrReqCode});

  Details.fromJson(Map<String, dynamic> json) {
    varDrName = json['varDrName'];
    varCategory = json['varCategory'];
    varSpeciality = json['varSpeciality'];
    varCity = json['varCity'];
    varReqDate = json['varReqDate'];
    varStatus = json['varStatus'];
    varAppDate = json['varAppDate'];
    varLatestStatus = json['varLatestStatus'];
    varStatusUpdatedBy = json['varStatusUpdatedBy'];
    varEmpCode = json['varEmpCode'];
    varEmpName = json['varEmpName'];
    varReqRemarks = json['varReqRemarks'];
    varAppRemarks = json['varAppRemarks'];
    varMobileNo = json['varMobileNo'];
    varDrReqCode = json['varDrReqCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['varDrName'] = this.varDrName;
    data['varCategory'] = this.varCategory;
    data['varSpeciality'] = this.varSpeciality;
    data['varCity'] = this.varCity;
    data['varReqDate'] = this.varReqDate;
    data['varStatus'] = this.varStatus;
    data['varAppDate'] = this.varAppDate;
    data['varLatestStatus'] = this.varLatestStatus;
    data['varStatusUpdatedBy'] = this.varStatusUpdatedBy;
    data['varEmpCode'] = this.varEmpCode;
    data['varEmpName'] = this.varEmpName;
    data['varReqRemarks'] = this.varReqRemarks;
    data['varAppRemarks'] = this.varAppRemarks;
    data['varMobileNo'] = this.varMobileNo;
    data['varDrReqCode'] = this.varDrReqCode;
    return data;
  }
}

class Status {
  bool isValid;
  String message;

  Status({this.isValid, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isValid'] = this.isValid;
    data['Message'] = this.message;
    return data;
  }
}

class DetailsD {
  String varDrName;
  String varCategory;
  String varSpeciality;
  String varCity;
  String varReqDate;
  String varStatus;
  String varAppDate;
  String varLatestStatus;
  String varStatusUpdatedBy;
  String varEmpCode;
  String varEmpName;
  String varReqRemarks;
  String varAppRemarks;
  Null varMobileNo;
  String varDrReqCode;

  DetailsD(
      {this.varDrName,
        this.varCategory,
        this.varSpeciality,
        this.varCity,
        this.varReqDate,
        this.varStatus,
        this.varAppDate,
        this.varLatestStatus,
        this.varStatusUpdatedBy,
        this.varEmpCode,
        this.varEmpName,
        this.varReqRemarks,
        this.varAppRemarks,
        this.varMobileNo,
        this.varDrReqCode});

  DetailsD.fromJson(Map<String, dynamic> json) {
    varDrName = json['varDrName'];
    varCategory = json['varCategory'];
    varSpeciality = json['varSpeciality'];
    varCity = json['varCity'];
    varReqDate = json['varReqDate'];
    varStatus = json['varStatus'];
    varAppDate = json['varAppDate'];
    varLatestStatus = json['varLatestStatus'];
    varStatusUpdatedBy = json['varStatusUpdatedBy'];
    varEmpCode = json['varEmpCode'];
    varEmpName = json['varEmpName'];
    varReqRemarks = json['varReqRemarks'];
    varAppRemarks = json['varAppRemarks'];
    varMobileNo = json['varMobileNo'];
    varDrReqCode = json['varDrReqCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['varDrName'] = this.varDrName;
    data['varCategory'] = this.varCategory;
    data['varSpeciality'] = this.varSpeciality;
    data['varCity'] = this.varCity;
    data['varReqDate'] = this.varReqDate;
    data['varStatus'] = this.varStatus;
    data['varAppDate'] = this.varAppDate;
    data['varLatestStatus'] = this.varLatestStatus;
    data['varStatusUpdatedBy'] = this.varStatusUpdatedBy;
    data['varEmpCode'] = this.varEmpCode;
    data['varEmpName'] = this.varEmpName;
    data['varReqRemarks'] = this.varReqRemarks;
    data['varAppRemarks'] = this.varAppRemarks;
    data['varMobileNo'] = this.varMobileNo;
    data['varDrReqCode'] = this.varDrReqCode;
    return data;
  }
}

