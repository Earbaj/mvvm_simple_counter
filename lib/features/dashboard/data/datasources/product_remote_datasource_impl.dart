
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:simple_mvvm/features/dashboard/data/datasources/product_remote_datasource.dart';
import 'package:simple_mvvm/features/dashboard/data/models/product_model.dart';

import '../../../../core/constants/api_constants.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{

  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    log("Inside getProducts Api functions");
    final response = await dio.get(
      "${ApiConstants.baseUrl}${ApiConstants.products}",
    );
    log("Inside getProducts After Api fetch");
    log("Api request result: ${response.data}");

    final listOfProducts = response.data['products'] as List<dynamic>; // explicitly cast
    log("Api products: $listOfProducts");

    return listOfProducts
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>)) // cast each item
        .toList();
  }


}