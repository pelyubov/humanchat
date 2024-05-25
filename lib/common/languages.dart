import 'package:get/get.dart';

class Languages extends Translations {
  static String hello = 'hello'.tr;
  static String forgotPassword = 'forgotPassword'.tr;
  static String login = 'login'.tr;
  static String register = 'register'.tr;
  static String registerQuestion = 'registerQuestion'.tr;
  static String password = 'password'.tr;
  static String confirm = 'confirmPassword'.tr;
  static String hadAcc = 'hadAcc'.tr;
  static String name = 'name'.tr;
  static String userName = 'userName'.tr;
  static String chatList = 'chatList'.tr;
  static String logout = 'logout'.tr;
  static String chatHided = 'chatHided'.tr;
  static String chatArchived = 'chatArchive'.tr;
  static String addChatTitle = 'addChatTitle'.tr;
  static String search = 'search'.tr;
  static String invalidEmail = 'invalidEmail'.tr;
  static String invalidPassword = 'invalidPassword'.tr;
  static String wrongPassword = 'wrongPassword'.tr;
  static String wrongEmail = 'wrongEmail'.tr;
  static String back = 'back'.tr;
  static String submit = 'submit'.tr;
  static String resetPassword = 'resetPassword'.tr;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Welcome to Human Chat',
          'forgotPassword': 'Forgot your password?',
          'password': 'Password',
          'login': 'Login',
          'register': 'Register',
          'registerQuestion': 'Don\'t have an account?',
          'confirmPassword': 'Confirm password',
          'hadAcc': 'Already have an account?',
          'name': 'Name',
          'userName': 'Username',
          'chatList': 'Chat list',
          'logout': 'Logout',
          'chatHided': 'Chats hided',
          'chatArchive': 'Chats archived',
          'addChatTitle': 'Add chat',
          'search': 'Search',
          'invalidEmail': 'Invalid email',
          'invalidPassword': 'Invalid password',
          'wrongPassword': 'Wrong password',
          'wrongEmail': 'Wrong email',
          'back': 'Back',
          'submit': 'Submit',
          'resetPassword': 'Reset password',
        },
        'vi_VN': {
          'hello': 'Xin chào Human Chat',
          'forgotPassword': 'Quên mật khẩu?',
          'password': 'Mật khẩu',
          'login': 'Đăng nhập',
          'register': 'Đăng ký',
          'registerQuestion': 'Chưa có tài khoản?',
          'confirmPassword': 'Xác nhận mật khẩu',
          'hadAcc': 'Đã có tài khoản?',
          'name': 'Tên',
          'userName': 'Tên đăng nhập',
          'chatList': 'Danh sách nhóm chat',
          'logout': 'Đăng xuất',
          'chatHided': 'Đã ẩn',
          'chatArchive': 'Lưu trữ',
          'addChatTitle': 'Tạo nhóm chat mới',
          'search': 'Tìm kiếm',
          'invalidEmail': 'Email không hợp lệ',
          'invalidPassword': 'Mật khẩu không hợp lệ',
          'wrongPassword': 'Mật khẩu không đúng',
          'wrongEmail': 'Email không đúng',
          'back': 'Quay lại',
          'submit': 'Xác nhận',
          'resetPassword': 'Thay đổi mật khẩu',
        }
      };
}
