import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/models/category.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductItem? product;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
          "Гадил нь гадилын ургамалд ургах жимс бөгөөд Зүүн Өмнөд Азийн дулаан бүсээс гаралтай. Гадил нь 100 орчим төрөл байдаг байна. Анх хүнсний чиглэлээр тарьж ургуулсан нь Папуа Шинэ Гвинейд байж болох талтай.",
          style: TextStyle(height: 1.5)),
    );
  }
}
