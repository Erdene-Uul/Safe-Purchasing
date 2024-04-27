import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/common/route_generator.dart';
import 'package:my_first_flutter_app/common/routes.dart';
import 'package:my_first_flutter_app/common/theme.dart';
import 'package:my_first_flutter_app/provider/cart_provider.dart';
import 'package:my_first_flutter_app/provider/favorite_provider.dart';
import 'package:my_first_flutter_app/provider/product_provider.dart';
import 'package:my_first_flutter_app/screens/base.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe purchase',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      themeMode: ThemeMode.light,
      home: const Base(),
      initialRoute: Routes.base,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
