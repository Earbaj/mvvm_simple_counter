
import 'package:simple_mvvm/features/dashboard/domain/entities/product.dart';

abstract class ProductRepository{
  Future<List<ProductEntity>> getProducts();
}