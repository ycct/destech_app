import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/book_model.dart';
import '../model/main_data_model.dart';
import '../utils/constants.dart';

class WebService {
  MainDataModel? mainDataModel;

  Future<List<BookModel>> fetchData(int quantity) async {
    List<BookModel> list = [];
    try {
      Uri serviceUri = Uri.parse(AppConstants.baseUrl +
          AppConstants.v1 +
          AppConstants.bookApi +
          quantity.toString());
      final response = await http.get(serviceUri);
      Map<String, dynamic> responseMap = jsonDecode(response.body);
      mainDataModel = MainDataModel.fromJson(responseMap);
      if (mainDataModel != null) {
        list.addAll(mainDataModel!.book!);
      }
    } catch (e) {
      return [];
    }
    return list;
  }
}
