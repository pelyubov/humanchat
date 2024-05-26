import 'package:get/get.dart';
import 'package:humanchat/entities/user.entity.dart';

class UserBloc extends GetxController {
  final users = RxList<User>([]);
}
