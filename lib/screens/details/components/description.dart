import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/models/category.dart';
import 'package:my_first_flutter_app/models/product_model.dart';


class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductItem? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(product != null ? product!.name : "",
          style: const TextStyle(height: 1.5)),
    );
  }
}
