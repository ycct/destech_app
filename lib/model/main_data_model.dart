import 'book_model.dart';

class MainDataModel {
  final String? status;
  final int? code;
  final int? total;
  final List<BookModel>? book;

  MainDataModel({
    this.status,
    this.code,
    this.total,
    this.book,
  });

  factory MainDataModel.fromJson(Map<String, dynamic> json) {
    var dataList = json["data"] as List;
    List<BookModel> dataModelList =
    dataList.map((e) => BookModel.fromJson(e)).toList();
    return MainDataModel(
      code: json["code"],
      status: json["status"],
      total: json["total"],
      book: dataModelList,
    );
  }
}
