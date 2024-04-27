typedef JsonMap = Map<String, dynamic>;

class CategoryResponse {
  List<CategoryModel>? data;

  bool hasError = false;
  String message = "";

  CategoryResponse(this.data);

  CategoryResponse.hasError(this.message) {
    message = message;
    hasError = true;
  }
}

class CategoryModel {
  String categoryName;
  List<ProductItem> items;

  CategoryModel({
    required this.items,
    required this.categoryName,
  });

  factory CategoryModel.fromJson(JsonMap json) {
    List<ProductItem> items = [];

    if (json['items'] != null) {
      var list = json['items'] as List;
      items = list.map((i) => ProductItem.fromJson(i)).toList();
    }

    return CategoryModel(
      categoryName: json['categoryName'] ?? '',
      items: items,
    );
  }
}

class ProductItem {
  int id;
  String barcodeId, name, image, createdAt;
  bool isAvailable;
  double price;

  ProductItem(
      {required this.id,
      required this.price,
      required this.name,
      required this.barcodeId,
      required this.createdAt,
      required this.image,
      required this.isAvailable});

  factory ProductItem.fromJson(JsonMap json) {
    return ProductItem(
      id: json['itemId'] ?? 0,
      price: json['price'] ?? 0.0,
      barcodeId: json['barcodeId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      name: json['name'] ?? '',
      image: json['image'].toString(),
      isAvailable: json['isAvailable'] ?? true,
    );
  }
}
