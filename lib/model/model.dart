// import 'dart:convert';
//
// Completedapi completedapiFromJson(String str) =>
//     Completedapi.fromJson(json.decode(str));
//
// String completedapiToJson(Completedapi data) => json.encode(data.toJson());
//
// class Completedapi {
//   Completedapi({
//     this.result,
//     this.status,
//     this.completed,
//   });
//
//   String? result;
//   bool? status;
//   List<Data>? completed;
//
//   factory Completedapi.fromJson(Map<String, dynamic> json) => Completedapi(
//         result: json["result"],
//         status: json["status"],
//         completed:
//             List<Data>.from(json["COMPLETED"].map((x) => Data.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": result,
//         "status": status,
//         "COMPLETED": List<dynamic>.from(completed!.map((x) => x.toJson())),
//       };
// }
//
// class Data {
//   Data({this.countryNumber,
//     this.contactsNumber,
//     this.countryName,
//     this.time,
//   });
//
//   double? countryNumber;
//   String? contactsNumber;
//   String? countryName;
//   DateTime? time;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         countryNumber: json['countryNumber'],
//         contactsNumber: json['contactsNumber'],
//         countryName: json['countryName'],
//         time: json['time'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "countryNumber": countryNumber,
//         "contactsNumber": contactsNumber,
//         "countryName": countryName,
//         "time": time,
//       };
// }

// import 'dart:convert';
//
// class UserDocModel {
//   String? countryNumber;
//   String? contactsNumber;
//   String? countryName;
//   String? time;
//
//   UserDocModel({
//     this.countryNumber,
//     this.contactsNumber,
//     this.countryName,
//     this.time,
//   });
//
//   factory UserDocModel.fromJson(Map<String, dynamic> json) => UserDocModel(
//     countryNumber: json['countryNumber'],
//     contactsNumber: json['contactsNumber'],
//     countryName: json['countryName'],
//     time: json['time'],
//   );
//
//   static Map<String, dynamic> toMap(UserDocModel data ) => {
//     "countryNumber": data.countryNumber,
//     "contactsNumber": data.contactsNumber,
//     "countryName": data.countryName,
//     "time": data.time,
//   };
//
//
//   static String encode(List<UserDocModel> data) => json.encode(
//     data
//         .map<Map<String, dynamic>>((data) => UserDocModel.toMap(data))
//         .toList(),
//   );
//
//   static List<UserDocModel> decode(String data) =>
//       (json.decode(data) as List<dynamic>)
//           .map<UserDocModel>((item) => UserDocModel.fromJson(item))
//           .toList();
//
// }

import 'dart:convert';

Completedapi completedapiFromJson(String str) =>
    Completedapi.fromJson(json.decode(str));

String completedapiToJson(Completedapi data) => json.encode(data.toJson());

class Completedapi {
  Completedapi({
    this.completed,
  });

  List<Data>? completed;

  factory Completedapi.fromJson(Map<String, dynamic> json) => Completedapi(
    completed:
    List<Data>.from(json["COMPLETED"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "COMPLETED": List<dynamic>.from(completed!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.countryNumber,
    this.contactsNumber,
    this.countryName,
    this.time,
  });

  String? countryNumber;
  String? contactsNumber;
  String? countryName;
  DateTime? time;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countryNumber: json['countryNumber'],
    contactsNumber: json['contactsNumber'],
    countryName: json['countryName'],
    time: json['time'],
  );

  Map<String, dynamic> toJson() => {
    "countryNumber": countryNumber,
    "contactsNumber": contactsNumber,
    "countryName": countryName,
    "time": time,
  };
}
