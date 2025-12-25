

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:simple_mvvm/features/dashboard/domain/entities/product.dart';
import 'package:simple_mvvm/features/dashboard/domain/usecases/get_products_usecase.dart';

class ProductViewModel extends ChangeNotifier{
  final ProductsUseCase productsUseCase;
  bool isLoading = false;
  List<ProductEntity> product = [];
  String? error;

  ProductViewModel({required this.productsUseCase});

  Future<void> fetchProducts() async {
    log('🚀 fetchProducts CALLED');
    isLoading = true;
    notifyListeners();
    try{
      log('🚀 fetchProducts CALLED try ');
      product = await productsUseCase();
      log('🚀 fetchProducts Api CALLED: $product');
    }catch(e){
      log('🚀 fetchProducts CALLED catch ');
      error = e.toString();
      log('🚀 fetchProducts CALLED catch error: $error');
    }
    isLoading = false;
    notifyListeners();
  }

}