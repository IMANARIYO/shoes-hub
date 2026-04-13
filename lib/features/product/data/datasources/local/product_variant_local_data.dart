import '../models/product_variant_model.dart';

final List<Map<String, dynamic>> _rawVariants = [
  {
    "id": 1,
    "size": "42",
    "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
    "sku": "SKU-1-1",
    "color": "Brown",
    "costPrice": 99,
    "stockQuantity": 35,
    "discountPrice": 103,
    "basePrice": 148,
    "product": {
      "id": 1,
      "name": "Product 1",
      "shortDescription": "Short description for Product 1",
      "slug": "product-1",
      "isPublished": false,
      "isFeatured": false,
      "isActive": true,
      "brand": {"id": 1, "name": "Nike", "image": "https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg"},
      "gender": {"id": 1, "name": "Men", "image": "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519"},
      "category": {"id": 2, "name": "Casual", "image": "https://images.unsplash.com/photo-1514989940723-e8e51635b782"},
      "material": {"id": 3, "name": "Canvas", "image": "https://images.unsplash.com/photo-1519741497674-611481863552"},
    },
  },
];

final List<ProductVariant> productVariants =
    _rawVariants.map(ProductVariant.fromJson).toList();
