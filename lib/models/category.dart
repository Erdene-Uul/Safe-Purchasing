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
  String barcodeId, name, image, createdAt, description;
  bool isAvailable;
  double price;

  ProductItem(
      {required this.id,
      required this.price,
      required this.name,
      required this.barcodeId,
      required this.createdAt,
      required this.image,
      required this.description,
      required this.isAvailable});

  factory ProductItem.fromJson(JsonMap json) {
    return ProductItem(
      id: json['itemId'] ?? 0,
      price: json['price'] ?? 0.0,
      barcodeId: json['barcodeId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'].toString(),
      isAvailable: json['isAvailable'] ?? true,
    );
  }
}

class ProductsResponseBlock {
  List<GetProductItem>? data;

  bool hasError = false;
  String message = "";

  ProductsResponseBlock(this.data);

  ProductsResponseBlock.hasError(this.message) {
    message = message;
    hasError = true;
  }
}

class GetProductItem {
  String id, barcode, manufacturerName, createdDate, deliveryDate, arrivalDate;
  // int 1;

  GetProductItem(
      {required this.id,
      required this.barcode,
      required this.manufacturerName,
      required this.createdDate,
      required this.deliveryDate,
      required this.arrivalDate});

  factory GetProductItem.fromJson(JsonMap json) {
    return GetProductItem(
      id: json['itemId'] ?? 0,
      barcode: json['barcode'] ?? 0.0,
      manufacturerName: json['manufacturerName'] ?? '',
      createdDate: json['deliveryDate'] ?? '',
      arrivalDate: json['arrivalDate'] ?? '',
      deliveryDate: json['deliveryDate'] ?? '',
    );
  }
}
