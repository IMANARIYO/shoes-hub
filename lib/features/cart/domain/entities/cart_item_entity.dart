class CartItemEntity {
  final String id;
  final int productVariantId;
  final String productName;
  final String variantImage;
  final String size;
  final String color;
  final int price;
  int quantity;

  CartItemEntity({
    required this.id,
    required this.productVariantId,
    required this.productName,
    required this.variantImage,
    required this.size,
    required this.color,
    required this.price,
    required this.quantity,
  });

  int get total => price * quantity;
}
