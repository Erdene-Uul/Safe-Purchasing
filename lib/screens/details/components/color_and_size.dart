import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/models/product_model.dart';
import 'color_dot.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Color'),
              Row(
                children: [
                  ColorDot(color: Color(0xFF356C95), isSelected: true),
                  ColorDot(color: Color(0xFFF8C078)),
                  ColorDot(color: Color(0xFFA29B9B)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                const TextSpan(text: 'Size\n'),
                TextSpan(
                  text: '${12} cm',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
