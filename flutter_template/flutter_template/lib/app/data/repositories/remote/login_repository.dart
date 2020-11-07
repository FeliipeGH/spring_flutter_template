import 'package:flutter_template/app/data/models/login/sign_in_user.dart';
import 'package:flutter_template/app/data/providers/remote/login_provider.dart';

class LoginRepository {
  final LoginProvider _loginProvider = LoginProvider();

  Future<void> login(SignInUser signInUser) => _loginProvider.login(signInUser);
}
