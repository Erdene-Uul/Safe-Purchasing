import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/models/category.dart';
import 'package:my_first_flutter_app/models/product_model.dart';
import 'package:my_first_flutter_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final ProductItem? product;
  String data;

  DetailsScreen({super.key, this.product, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
        data: data,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
            )),
        const SizedBox(width: kDefaultPadding),
      ],
    );
  }
}
