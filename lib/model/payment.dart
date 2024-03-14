// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

part of 'model.dart';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  String status;
  String message;
  int count;
  List<PaymentData> data;
  Pagination pagination;

  Payment({
    required this.status,
    required this.message,
    required this.count,
    required this.data,
    required this.pagination,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        data: List<PaymentData>.from(
            json["data"].map((x) => PaymentData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class PaymentData {
  int id;
  String namePayment;
  String gambarPayment;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentData({
    required this.id,
    required this.namePayment,
    required this.gambarPayment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        id: json["id"],
        namePayment: json["name_payment"],
        gambarPayment: json["gambar_payment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_payment": namePayment,
        "gambar_payment": gambarPayment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
