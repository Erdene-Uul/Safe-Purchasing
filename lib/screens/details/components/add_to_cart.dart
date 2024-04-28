import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_first_flutter_app/common/colors.dart';
import 'package:my_first_flutter_app/models/category.dart';
import 'package:my_first_flutter_app/screens/widgets/bottom.dart';
import 'package:my_first_flutter_app/service/index.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductItem? product;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    String _scanBarcode = 'Unknown';

    Future<void> scanQR() async {
      String barcodeScanRes;
      // Platform messages may fail, so we use a try/catch PlatformException.
      // try {
      //   barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      //       '#ff6666', 'Cancel', true, ScanMode.QR);
      //   print(barcodeScanRes);
      // } on PlatformException {
      //   barcodeScanRes = 'Failed to get platform version.';
      // }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.

      setState(() {
        // _scanBarcode = barcodeScanRes;

        if (_scanBarcode == "Unknown") {
          customModalBottomSheet(context,
              height: 12,
              //isDismissible: false,
              child: MyWidgetInfo());
        }
      });
    }

    downloadData() async {
      await dataUtil.getProductBlock().then((data) {
        print("DATAGET ========== ${data.data}");
        setState(() {
          isLoading = false;
        });
        // if (data.hasError) {
        //   return "";
        // }
        // setState(() {
        //   list = data.data!;
        //   print("SCREEN =========== ${list.length}");
        // });
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: kDefaultPadding),
            height: 58.0,
            width: 58.0,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: IconButton(
              onPressed: () {
                // scanQR();
                // FlutterBarcodeScanner.getBarcodeStreamReceiver(
                //         "#ff6666", "Cancel", false, ScanMode.DEFAULT)
                //     ?.listen((barcode) {
                //   /// barcode to be used
                // });
                downloadData();
                print("==============BARCODE========= ");
                // if (barcode.contains("]C1")) {
                //   barcode = barcode.substring(3, barcode.length);
                // }
                // _getBarCodeId(barcode);
                // isCheck = false;
              },
              icon: SvgPicture.asset(
                'assets/icons/qr.svg',
                color: kPrimaryColor,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 58,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => kPrimaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                ),
                child: Text(
                  'захиалах'.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> customModalBottomSheet(
    BuildContext context, {
    bool isDismissible = true,
    double? height,
    VoidCallback? closeEvent,
    required Widget child,
  }) {
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6 * 2),
          topRight: Radius.circular(6 * 2),
        ),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: child,
      ),
    ).then((value) => closeEvent!());
  }
}
