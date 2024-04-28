import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter_app/const.dart';
import 'package:my_first_flutter_app/models/category.dart';

final DataUtil dataUtil = DataUtil();

class DataUtil {
  static final DataUtil _dataUtil = DataUtil._internal();

  factory DataUtil() {
    return _dataUtil;
  }

  DataUtil._internal();

  Future<CategoryResponse> getCategory() async {
    http.Response response = await http.get(
      Uri.parse("${Consts.httpUrl}item"),
      headers: {
        "content-type": "application/json",
      },
    );

    var responseJson = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(responseJson['data']);
      List<dynamic> list =
          responseJson['data'].map((i) => CategoryModel.fromJson(i)).toList();
      List<CategoryModel> models = list.cast();
      return CategoryResponse(models);
    }
    return CategoryResponse.hasError(responseJson['errorMessage'].toString());
  }

  Future<ProductsResponseBlock> getProductBlock() async {
    http.Response response = await http.get(
      Uri.parse("${Consts.httpUrlBlock}products"),
      headers: {
        "content-type": "application/json",
      },
    );

    print("BLOCKCHAIN ITEM =============== $response");
    var responseJson = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print(responseJson['data']);
      List<dynamic> list =
          responseJson['data'].map((i) => GetProductItem.fromJson(i)).toList();
      List<GetProductItem> models = list.cast();
      print(models);
      return ProductsResponseBlock(models);
    }
    return ProductsResponseBlock.hasError(
        responseJson['errorMessage'].toString());
  }
}
