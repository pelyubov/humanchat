import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanchat/common/languages.dart';
import 'package:humanchat/core/cache.dart';
import 'package:humanchat/core/routes.dart';
import 'package:humanchat/features/auth/presentation/pages/loading.page.dart';
import 'package:humanchat/features/auth/presentation/pages/login.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetPage<dynamic> page({required String name, required Widget page}) {
      return GetPage(name: name, page: () => page);
    }

    return GetMaterialApp(
      title: 'Human Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: Languages(),
      locale: const Locale('vi', 'VN'),
      fallbackLocale: const Locale('en', 'US'),
      home: const Scaffold(),
      initialRoute: '/',
      getPages: [
        page(name: AppRoutes.welcome, page: const Loading()),
        page(name: AppRoutes.login, page: LoginPage()),
        // page(name: 'register', page: const RegisterPage()),
        // page(name: 'forgotPassword', page: const ForgotPasswordPage()),
        // page(name: 'checkPinCode', page: const CheckPinCodePage()),
        // page(name: 'checkPinCode', page: const CheckPinCodePage()),
        // page(name: 'resetPassword', page: const ResetPasswordPage()),
      ],
    );
  }
}
