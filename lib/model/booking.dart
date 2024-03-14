// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

part of 'model.dart';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  String status;
  String message;
  List<BookingData> data;

  Booking({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        status: json["status"],
        message: json["message"],
        data: List<BookingData>.from(json["data"].map((x) => BookingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BookingData {
  int id;
  DateTime dateBooking;
  String nameBooking;
  String contactBooking;
  int qtyBooking;
  int totalBooking;
  bool statusBooking;
  DateTime createdAt;
  DateTime updatedAt;

  BookingData({
    required this.id,
    required this.dateBooking,
    required this.nameBooking,
    required this.contactBooking,
    required this.qtyBooking,
    required this.totalBooking,
    required this.statusBooking,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json["id"],
        dateBooking: DateTime.parse(json["date_booking"]),
        nameBooking: json["name_booking"],
        contactBooking: json["contact_booking"],
        qtyBooking: json["qty_booking"],
        totalBooking: json["total_booking"],
        statusBooking: json["status_booking"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_booking": dateBooking.toIso8601String(),
        "name_booking": nameBooking,
        "contact_booking": contactBooking,
        "qty_booking": qtyBooking,
        "total_booking": totalBooking,
        "status_booking": statusBooking,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
