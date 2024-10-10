import 'package:astronacci/utils/config/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: GetMaterialApp(
        //theme: ThemeConfig.mainTheme(context),
        initialRoute: RouteConfig.home,
        // initialBinding: InitialBinding(),
        unknownRoute: RouteConfig.unknownPage,
        getPages: RouteConfig().listPages,
      ),
    );
  }
}
