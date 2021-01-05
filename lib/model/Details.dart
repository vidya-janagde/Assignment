import 'package:json_annotation/json_annotation.dart';


part 'Details.g.dart';
@JsonSerializable(explicitToJson: true,anyMap: true)
class Details {

  @JsonKey(name: 'varDrName', defaultValue: '')
  String varDrName;
  @JsonKey(name: 'varCategory', defaultValue: '')
  String varCategory;
  @JsonKey(name: 'varSpeciality', defaultValue: '')
  String varSpeciality;
  @JsonKey(name: 'varCity', defaultValue: '',)
  String varCity;
  @JsonKey(name: 'varReqDate', defaultValue: '',)
  String varReqDate;
  @JsonKey(name: 'varStatus', defaultValue: '')
  String varStatus;
  @JsonKey(name: 'varAppDate', defaultValue: '')
  String varAppDate;
  @JsonKey(name: 'varLatestStatus', defaultValue: '')
  String varLatestStatus;
  @JsonKey(name: 'varStatusUpdatedBy', defaultValue: '')
  String varStatusUpdatedBy;
  @JsonKey(name: 'varEmpCode', defaultValue: '')
  String varEmpCode;
  @JsonKey(name: 'varEmpName', defaultValue: '')
  String varEmpName;
  @JsonKey(name: 'varReqRemarks', defaultValue: '')
  String varReqRemarks;
  @JsonKey(name: 'varAppRemarks', defaultValue: '')
  String varAppRemarks;
  @JsonKey(name: 'varMobileNo', defaultValue: '')
  Null varMobileNo;
  @JsonKey(name: 'varDrReqCode', defaultValue: '')
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


  factory Details.fromJson(Map<String,dynamic>  json) =>_$DetailsFromJson(json);

  Map <String,dynamic> toJson() => _$DetailsToJson(this);
}