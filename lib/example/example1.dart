import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:remote_request/remote_request.dart';

class RemoteCallsController {
  static Future<void> getDataFromRemoteNetworkCall() async {
    var response = await Request.get("ENDPOINT/get/");
    List<CaseModel>? cases;
    try {
      if (response != null && response.statusCode == 200) {
        var jsonData = response.data;
        if (jsonData["status"] == 200) {
          cases = [];
          for (var temp in jsonData["data"]) {
            log("Case : $temp");
            cases.add(CaseModel.fromMap(temp));
          }
        } else {
          throw await Request.throwExceptionFromStatusCode(jsonData["status"]);
        }
      }
    } on DioException catch (e) {
      log(e.toString());
      throw await Request.throwException(e);
    }
  }
}

class Case {
  final String ticketid;
  final String docket;
  final String meName;
  final String cpName;
  final String cpNumber;
  final String bank;
  final String activityType;
  final DateTime? docketDate;
  final DateTime? assignedDate;
  final DateTime? targetDate;
  final String model;
  final String sla;
  final String priority;
  final String? tl;
  final String remarks;
  final DateTime? planDate;
  final String? previousStatus;
  final String? previousAttendedDate;
  final String? previousFse;
  final String previousNstpCategory;
  final String previousRevisitCategory;
  final DateTime? rejectedDate;
  final String? rejectReason;
  final String address;
  final String mobile;
  final String description;
  final String city;
  final String pincode;
  final String tid;
  final String assignedtime;
  final DateTime? accepteddate;
  final String acceptedtime;

  Case({
    required this.ticketid,
    required this.docket,
    required this.meName,
    required this.cpName,
    required this.cpNumber,
    required this.bank,
    required this.activityType,
    required this.docketDate,
    required this.assignedDate,
    required this.targetDate,
    required this.model,
    required this.sla,
    required this.priority,
    required this.tl,
    required this.remarks,
    required this.planDate,
    required this.previousStatus,
    required this.previousAttendedDate,
    required this.previousFse,
    required this.previousNstpCategory,
    required this.previousRevisitCategory,
    required this.rejectedDate,
    required this.rejectReason,
    required this.mobile,
    required this.address,
    required this.description,
    required this.city,
    required this.pincode,
    required this.tid,
    required this.assignedtime,
    required this.accepteddate,
    required this.acceptedtime,
  });
}

String caseModelToMap(CaseModel data) => json.encode(data.toMap());

class CaseModel extends Case {
  CaseModel({
    required super.ticketid,
    required super.docket,
    required super.meName,
    required super.cpName,
    required super.cpNumber,
    required super.bank,
    required super.activityType,
    required super.docketDate,
    required super.assignedDate,
    required super.targetDate,
    required super.model,
    required super.sla,
    required super.priority,
    required super.tl,
    required super.remarks,
    required super.planDate,
    required super.previousStatus,
    required super.previousAttendedDate,
    required super.previousFse,
    required super.previousNstpCategory,
    required super.previousRevisitCategory,
    required super.rejectedDate,
    required super.rejectReason,
    required super.mobile,
    required super.address,
    required super.description,
    required super.city,
    required super.pincode,
    required super.tid,
    required super.assignedtime,
    required super.accepteddate,
    required super.acceptedtime,
  });

  factory CaseModel.fromMap(Map<String, dynamic> json) => CaseModel(
        ticketid: json["ticketid"] ?? "",
        docket: json["docket"] ?? "",
        meName: json["me_name"] ?? "",
        cpName: json["cp_name"] ?? "",
        cpNumber: json["cp_number"] ?? "",
        bank: json["bank"] ?? "",
        activityType: json["activity_type"] ?? "",
        docketDate: (json["docket_date"] != null)
            ? DateTime.parse(json["docket_date"])
            : null,
        assignedDate: (json["assigneddate"] != null)
            ? DateTime.parse(json["assigneddate"])
            : null,
        targetDate: (json["target_date"] != null)
            ? DateTime.parse(json["target_date"])
            : null,
        model: json["model"] ?? "",
        sla: json["sla"] ?? "",
        priority: json["priority"] ?? "",
        tl: json["tl"] ?? "",
        remarks: json["remarks"] ?? "",
        planDate: (json["plandate"] != null)
            ? DateTime.parse(json["plandate"])
            : null,
        previousStatus: json["previous_status"],
        previousAttendedDate: json["previous_attended_date"],
        previousFse: json["previous_fse"],
        previousNstpCategory: json["previous_nstp_category"],
        previousRevisitCategory: json["previous_revisit_category"],
        rejectedDate: (json["rejecteddate"] != null)
            ? DateTime.parse(json["rejecteddate"])
            : null,
        rejectReason: json["rejecreason"],
        address: json["address"] ?? "",
        mobile: json["mobile"] ?? "",
        description: json["description"],
        city: json["city"] ?? "",
        pincode: json["pincode"] ?? "",
        tid: json["tid"],
        assignedtime: json["assignedtime"] ?? "",
        acceptedtime: json["acceptedtime"] ?? "",
        accepteddate: (json["accepteddate"] != null)
            ? DateTime.parse(json["accepteddate"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "ticketid": ticketid,
        "docket": docket,
        "me_name": meName,
        "cp_name": cpName,
        "cp_number": cpNumber,
        "bank": bank,
        "activity_type": activityType,
        "docket_date":
            "${docketDate?.year.toString().padLeft(4, '0')}-${docketDate?.month.toString().padLeft(2, '0')}-${docketDate?.day.toString().padLeft(2, '0')}",
        "target_date":
            "${targetDate?.year.toString().padLeft(4, '0')}-${targetDate?.month.toString().padLeft(2, '0')}-${targetDate?.day.toString().padLeft(2, '0')}",
        "model": model,
        "sla": sla,
        "priority": priority,
        "tl": tl,
        "remarks": remarks,
        "previous_status": previousStatus,
        "previous_attended_date": previousAttendedDate,
        "previous_fse": previousFse,
        "previous_nstp_category": previousNstpCategory,
        "previous_revisit_category": previousRevisitCategory,
      };
}
