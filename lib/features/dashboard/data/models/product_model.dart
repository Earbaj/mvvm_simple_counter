import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? "",
      name: json['name'] ?? 'No Name',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      image: json['image'] ??
          (json['images'] != null && json['images'].isNotEmpty
              ? json['images'][0]
              : 'https://via.placeholder.com/150'),
    );
  }
}
