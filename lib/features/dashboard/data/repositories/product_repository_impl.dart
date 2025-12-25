
import 'dart:developer';

import 'package:simple_mvvm/features/dashboard/data/datasources/product_remote_datasource.dart';
import 'package:simple_mvvm/features/dashboard/domain/entities/product.dart';
import 'package:simple_mvvm/features/dashboard/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts() {
    log('📡 Repository getProducts CALLED');
    return remoteDataSource.getProducts();
  }

}