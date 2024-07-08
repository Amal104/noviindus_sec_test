import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:noviindus_sec_test/Provider/Login_Provider.dart';
import 'package:noviindus_sec_test/View/Screens/LoginScreen.dart';
import 'package:provider/provider.dart';

import 'Provider/Home_Provider.dart';
import 'View/Screens/AddFeedScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: UploadPage(),
      ),
    );
  }
}
