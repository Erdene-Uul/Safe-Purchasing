import 'package:my_first_flutter_app/models/category.dart';
import 'package:my_first_flutter_app/models/product_model.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CartModel {
  final String id;
  final ProductItem product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
  }) : id = uuid.v4();
}
