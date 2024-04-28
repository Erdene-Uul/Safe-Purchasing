import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/models/category.dart';
import 'package:my_first_flutter_app/models/product_model.dart';
import 'package:my_first_flutter_app/screens/details/components/product_title_with_image.dart';
import 'add_to_cart.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';

class Body extends StatelessWidget {
  final ProductItem? product;
  String data;
  Body({super.key, this.product, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.34),
            padding: EdgeInsets.only(
                top: size.height * 0.01,
                left: kDefaultPadding,
                right: kDefaultPadding),
            height: 480.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              children: [
                // ColorAndSize(product: product),
                const SizedBox(
                  height: 30,
                ),
                Description(product: product),
                const SizedBox(height: kDefaultPadding / 2),
                const CounterWithFavBtn(),
                const SizedBox(height: kDefaultPadding / 2),
                AddToCart(product: product),
              ],
            ),
          ),
          ProductTitleWithImage(product: product, categorName: data),
        ],
      ),
    );
  }
}
