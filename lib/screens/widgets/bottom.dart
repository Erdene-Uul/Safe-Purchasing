import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidgetInfo extends StatelessWidget {
  const MyWidgetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "Блокчайн дээр бүртгэгдсэн барааны  мэдээлэл",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Жүр үр ХХК- аас үйлдвэрлэгдсэн"),
          subtitle: Text("2024-02-24 14:30:43"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.delivery_dining),
          title: Text("Ачилтанд гарсан"),
          subtitle: Text("2024-02-23 14:30:"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.store_sharp),
          title: Text("Дэлгүүр хүлээн авсан"),
          subtitle: Text("2024-02-34"),
        )
      ],
    );
  }
}
