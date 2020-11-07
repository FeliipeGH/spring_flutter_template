import 'package:get/get.dart';

class SignInUserRx {
  RxString userNameError = "".obs;
  RxString passwordError = "".obs;
  RxBool passwordVisible = true.obs;

  String userNameErrorAsString() =>
      userNameError.value == "" ? null : userNameError.value;

  String passwordErrorAsString() =>
      passwordError.value == "" ? null : passwordError.value;

  @override
  String toString() {
    return 'SignInUserRx{userNameError: $userNameError, passwordError: $passwordError, passwordVisible: $passwordVisible}';
  }
}
