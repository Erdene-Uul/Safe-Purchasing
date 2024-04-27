import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleOverflowWidget extends StatelessWidget {
  String? title;
  Color? color;
  double? size;
  FontWeight? fontWeight;

  TitleOverflowWidget(
      {this.title, this.color, this.size, this.fontWeight, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.center,
    );
  }
}
