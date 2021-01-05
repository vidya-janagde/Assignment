
import 'package:flutter_chilkasoft/model/Details.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Status.dart';

part 'employeeModel.g.dart';
@JsonSerializable(explicitToJson: true,anyMap: true)
class Employee {

  @JsonKey(name: 'Status', defaultValue: '',ignore: true)
  Status status;

  @JsonKey(name: 'Details', defaultValue: '')
  Details details;

  @JsonKey(name: 'lstDrAdditionCityDetails', defaultValue: '',ignore: true)
  var lstDrAdditionCityDetails;

  @JsonKey(name: 'lstDrAdditionHospitalDetails', defaultValue: '',ignore: true)
  var lstDrAdditionHospitalDetails;

  Employee(
      {this.status,
        this.details,
        this.lstDrAdditionCityDetails,
        this.lstDrAdditionHospitalDetails});

  factory Employee.fromJson(Map<String,dynamic>  json) =>_$EmployeeFromJson(json);

  Map <String,dynamic> toJson() => _$EmployeeToJson(this);


}



