// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.status,
    required this.msg,
    required this.result,
  });

  String status;
  List<dynamic> msg;
  List<Result> result;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        status: json["status"],
        msg: List<dynamic>.from(json["msg"].map((x) => x)),
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": List<dynamic>.from(msg.map((x) => x)),
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.day,
    this.startTime,
    this.endTime,
    this.appoinmentId,
    this.status,
    this.fee,
    this.patientAppId,
    this.reson,
    this.debit,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
  });

  String day;
  dynamic startTime;
  dynamic endTime;
  String? appoinmentId;
  String? status;
  String? fee;
  String? patientAppId;
  String? reson;
  String? debit;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        appoinmentId: json["appoinment_id"],
        status: json["status"],
        fee: json["fee"],
        patientAppId: json["patientAppId"],
        reson: json["reson"],
        debit: json["debit"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "appoinment_id": appoinmentId,
        "status": status,
        "fee": fee,
        "patientAppId": patientAppId,
        "reson": reson,
        "debit": debit,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
      };
}
