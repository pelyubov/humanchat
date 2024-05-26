import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanchat/common/languages.dart';
import 'package:humanchat/core/cache.dart';
import 'package:humanchat/core/routes.dart';
import 'package:humanchat/features/auth/presentation/pages/loading.page.dart';
import 'package:humanchat/features/auth/presentation/pages/login.page.dart';
import 'package:humanchat/features/chat/presentation/pages/addChat.page.dart';
import 'package:humanchat/features/chat/presentation/pages/chatlist.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache().init();
  runApp(const MyApp());
}

GetPage<dynamic> page({required String name, required Widget page}) {
  return GetPage(name: name, page: () => page);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      initialRoute: AppRoutes.chatList,
      getPages: [
        page(name: AppRoutes.loading, page: const Landing()),
        page(name: AppRoutes.login, page: LoginPage()),
        page(name: AppRoutes.chatList, page: ChatListPage()),
        page(name: AppRoutes.chatAdd, page: const AddChatPage()),

        // page(name: 'register', page: const RegisterPage()),
        // page(name: 'forgotPassword', page: const ForgotPasswordPage()),
        // page(name: 'checkPinCode', page: const CheckPinCodePage()),
        // page(name: 'checkPinCode', page: const CheckPinCodePage()),
        // page(name: 'resetPassword', page: const ResetPasswordPage()),
      ],
    );
  }
}
