// To parse this JSON data, do
//
//     final lupaPassword = lupaPasswordFromJson(jsonString);

part of 'model.dart';

LupaPassword lupaPasswordFromJson(String str) =>
    LupaPassword.fromJson(json.decode(str));

String lupaPasswordToJson(LupaPassword data) => json.encode(data.toJson());

class LupaPassword {
  String status;
  String message;
  Data data;

  LupaPassword({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LupaPassword.fromJson(Map<String, dynamic> json) => LupaPassword(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
