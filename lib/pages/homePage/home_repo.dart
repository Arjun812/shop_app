import 'dart:convert';

import 'package:dio/dio.dart' as dios;
import 'package:shop_app/pages/homePage/model/product_model.dart';

import '../../services/request_services.dart';
import '../../services/url.dart';

Future<ProductModel> getProductRepo() async {
  var header = {
    "Content-Type": "application/json;charset=UTF-8",
    'Accept': 'application/json',
  };
  try {
    final res = await Api().request(
      url:Url.product,
      header: header,
      type: RequestType.Get,
    );
    ProductModel _model = ProductModel.fromJson(json.decode(res));
    return _model;
  } on FormatException catch (e) {
    throw e.message;
  } catch (e) {
    throw e;
  }
}