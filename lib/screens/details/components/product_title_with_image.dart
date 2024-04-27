import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/const.dart';
import 'package:my_first_flutter_app/models/category.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage(
      {Key? key, required this.product, required this.categorName})
      : super(key: key);

  final ProductItem? product;
  final String categorName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: product != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  "${categorName}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  product!.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: 'Үнэ\n', style: TextStyle(fontSize: 16)),
                            TextSpan(
                                text: formatMoney(product!.price),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Hero(
                        tag: '${1}',
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Image.network(
                            product!.image,
                          ),
                        )),
                  ],
                ),
              ],
            )
          : SizedBox(),
    );
  }
}
