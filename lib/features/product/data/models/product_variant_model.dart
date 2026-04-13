import 'product_model.dart';

class ProductVariant {
  final int id;
  final String size;
  final String image;
  final String sku;
  final String color;
  final int costPrice;
  final int stockQuantity;
  final int discountPrice;
  final int basePrice;
  final Product product;

  const ProductVariant({
    required this.id,
    required this.size,
    required this.image,
    required this.sku,
    required this.color,
    required this.costPrice,
    required this.stockQuantity,
    required this.discountPrice,
    required this.basePrice,
    required this.product,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json['id'],
      size: json['size'],
      image: json['image'],
      sku: json['sku'],
      color: json['color'],
      costPrice: json['costPrice'],
      stockQuantity: json['stockQuantity'],
      discountPrice: json['discountPrice'],
      basePrice: json['basePrice'],
      product: Product.fromJson(json['product']),
    );
  }
}
