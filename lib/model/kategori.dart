part of 'model.dart';

// To parse this JSON kategoriList, do
//
//     final Kategori = KategoriFromJson(jsonString);

Kategori KategoriFromJson(String str) =>
    Kategori.fromJson(json.decode(str));

String KategoriToJson(Kategori kategoriList) =>
    json.encode(kategoriList.toJson());

class Kategori {
  String status;
  String message;
  int count;
  List<DataKategori> kategoriList;
  Pagination pagination;

  Kategori({
    required this.status,
    required this.message,
    required this.count,
    required this.kategoriList,
    required this.pagination,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        kategoriList: List<DataKategori>.from(
            json["kategoriList"].map((x) => DataKategori.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "kategoriList": List<dynamic>.from(kategoriList.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class DataKategori {
  int id;
  String namaKategori;
  String gambarKategori;
  AtedBy createdBy;
  AtedBy? updatedBy;

  DataKategori({
    required this.id,
    required this.namaKategori,
    required this.gambarKategori,
    required this.createdBy,
    required this.updatedBy,
  });

  factory DataKategori.fromJson(Map<String, dynamic> json) => DataKategori(
        id: json["id"],
        namaKategori: json["nama_kategori"],
        gambarKategori: json["gambar_kategori"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: json["updated_by"] == null
            ? null
            : AtedBy.fromJson(json["updated_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
        "gambar_kategori": gambarKategori,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy?.toJson(),
      };
}

class AtedBy {
  int id;
  String nama;

  AtedBy({
    required this.id,
    required this.nama,
  });

  factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
