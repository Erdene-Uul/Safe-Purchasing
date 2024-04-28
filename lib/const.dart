import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Consts {
  static const String contentType = "application/json; charset=utf-8";
  static const String successSave = "Амжилттай хадгаллаа";
  static bool showPin = false;
  static const String internetError = "Интернэт холболтоо шалгана уу";

  static bool isLocal = false;
  static String localAddress = "item";
  static final String httpUrl = "https://expressjs-17jy.onrender.com/api/v1/";
  static final String httpUrlBlock = "http://172.20.10.3:3003/";
}

String formatMoney(double value) {
  return "${NumberFormat(",###.##", "mn-MN").format(value)}₮";
}

//verticalPadding
const kNormalVerticalSpace = SizedBox(height: 20.0);
const kDefaultVerticalSpace = SizedBox(height: 16.0);
const kMediumVerticalSpace = SizedBox(height: 24.0);
const kSmallDefaultVerticalSpace = SizedBox(height: 10.0);
const kLargeVerticalSpace = SizedBox(height: 32.0);
const kExtraLargeVerticalSpace = SizedBox(height: 64.0);
const kSmallVerticalSpace = SizedBox(height: 8.0);
const kTinyVerticalSpace = SizedBox(height: 4.0);
const kLargeBigVerticalSpace = SizedBox(height: 48.0);
//horizontalPadding
const kVerySmallHorizontalSpace = SizedBox(width: 4.0);
const kUltraSmallHorizontalSpace = SizedBox(width: 2.0);
const kSmallHorizontalSpace = SizedBox(width: 8.0);
const kMediumHorizontalSpace = SizedBox(width: 16.0);
const kLargeHorizontalSpace = SizedBox(width: 32.0);
const kLargeUltraHorizontalSpace = SizedBox(width: 64.0);
const kBigTextSize = 20.0;
const kDefaultSize = 16.0;
const kSmallSize = 16.0;
