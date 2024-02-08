// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

part of 'model.dart';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  String status;
  String message;
  int count;
  List<KategoriData> data;
  Pagination pagination;

  Kategori({
    required this.status,
    required this.message,
    required this.count,
    required this.data,
    required this.pagination,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        data: List<KategoriData>.from(json["data"].map((x) => KategoriData.fromJson(x))),
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

class KategoriData {
  int id;
  String namaKategori;
  String gambarKategori;
  AtedBy createdBy;
  AtedBy? updatedBy;

  KategoriData({
    required this.id,
    required this.namaKategori,
    required this.gambarKategori,
    required this.createdBy,
    required this.updatedBy,
  });

  factory KategoriData.fromJson(Map<String, dynamic> json) => KategoriData(
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

class Pagination {
  int page;
  int pageSize;

  Pagination({
    required this.page,
    required this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
      };
}
