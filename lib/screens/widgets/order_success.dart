import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/const.dart';
import 'package:my_first_flutter_app/provider/cart_provider.dart';
import 'package:my_first_flutter_app/screens/shop/shop_screen.dart';
import 'package:my_first_flutter_app/screens/widgets/title_owerflow_widget.dart';

import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderSuccessScreen extends StatefulWidget {
  final int orderId;
  final String amount;

  const OrderSuccessScreen(
      {required this.orderId, required this.amount, Key? key})
      : super(key: key);

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  bool isLoading = false;
  bool isSuccess = false;
  final moneyController = TextEditingController();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(child: bankBuild()));
  }

  Widget bankBuild() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleOverflowWidget(
              title: 'Таны захиалга амжилттай үүслээ',
              color: Colors.black,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            kDefaultVerticalSpace,
            TitleOverflowWidget(
              title: 'Захиалгын дугаар: ${widget.orderId}',
              color: Colors.black,
              size: 18,
              fontWeight: FontWeight.bold,
            ),
            kDefaultVerticalSpace,
            QrImageView(
              data: '${widget.orderId}',
              version: QrVersions.auto,
              size: 150.0,
            ),
            kDefaultVerticalSpace,
            TitleOverflowWidget(
              title:
                  'Та дараах банкны данс руу төлбөрөө шилжүүлсэнээр захиалга баталгаажих болно. Гүйлгээний утга дээр зөвхөн захиалгын дугаарыг бичихийг анхаарна уу.',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.normal,
            ),
            kDefaultVerticalSpace,
            buildItems('Банк:', 'Хаан банкны данс'),
            buildItems('Дансны дугаар:', "5038110628"),
            buildItems('Хүлээн авагч:', "Номин Хайперматкет"),
            buildItems('Үнийн дүн:', formatMoney(double.parse(widget.amount))),
            buildItems('Гүйлгээний утга:', widget.orderId.toString()),
            kLargeVerticalSpace,
            ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().removeAllItem();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Center(
                child: Text(
                  "Захиалга дуусгах",
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItems(title, String param) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleOverflowWidget(
                  title: title,
                  color: Colors.black,
                  size: 14,
                  fontWeight: FontWeight.normal),
              TitleOverflowWidget(
                  title: param ?? '',
                  color: Colors.black,
                  size: 14,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: param));
              // Utils.showSnackBar(context, 'Амжилттай хууллаа: $param', '',
              //     CupertinoColors.activeGreen, null);
            },
            icon: const Icon(Icons.copy))
      ]),
    );
  }
}
