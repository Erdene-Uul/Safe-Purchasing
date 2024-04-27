import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_first_flutter_app/models/category.dart';
import 'package:my_first_flutter_app/provider/product_provider.dart';
import 'package:my_first_flutter_app/screens/shop/product.dart';
import 'package:my_first_flutter_app/service/index.dart';
import 'package:provider/provider.dart';

import '../widgets/category_header.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<CategoryModel> list = [];
  bool isLoading = false;

  @override
  void initState() {
    downloadData();
    super.initState();
  }

  downloadData() async {
    setState(() {
      isLoading = true;
    });

    await dataUtil.getCategory().then((data) {
      setState(() {
        isLoading = false;
      });
      if (data.hasError) {
        return "";
      }
      setState(() {
        list = data.data!;
        print("SCREEN =========== ${list.length}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.080,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Бат Гомбоо",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.050,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              "хэрэглэгч",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: size.width * 0.040,
                              ),
                            )
                          ],
                        ),
                        CircleAvatar(
                          radius: size.width * 0.060,
                          foregroundImage: const NetworkImage(
                            "https://t3.ftcdn.net/jpg/02/00/90/24/360_F_200902415_G4eZ9Ok3Ypd4SZZKjc8nqJyFVp1eOD6V.jpg",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    SizedBox(
                      width: size.width,
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusColor: Colors.black38,
                          isCollapsed: false,
                          hintText: "Бараа хайх",
                          prefixIcon: const Icon(Icons.search),
                          hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: size.width * 0.040,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.01,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.030,
                    ),
                    Column(
                      children: <Widget>[
                        for (int i = 0; i < list.length; i++)
                          Column(
                            children: [
                              CategoryHeader(
                                title: list[i].categoryName,
                                count: '${list[i].items.length}',
                              ),
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: list[i]
                                      .items
                                      .map((product) => Product(
                                          product: product,
                                          categoryName: list[i].categoryName))
                                      .toList(),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                            ],
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
