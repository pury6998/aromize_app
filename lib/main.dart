import 'package:aromize_app/controller/core_controller.dart';
import 'package:aromize_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialBinding: BindingsBuilder(() {
        Get.put(CoreController());
      }),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
