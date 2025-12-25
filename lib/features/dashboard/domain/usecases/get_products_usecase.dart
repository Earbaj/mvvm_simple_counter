
import 'dart:developer';

import 'package:simple_mvvm/features/dashboard/domain/entities/product.dart';
import '../repositories/product_repository.dart';

class ProductsUseCase {
  final ProductRepository repository;

  ProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() {
    log('🌐 ProductsUseCase CALLED');
    return repository.getProducts();
  }
}
