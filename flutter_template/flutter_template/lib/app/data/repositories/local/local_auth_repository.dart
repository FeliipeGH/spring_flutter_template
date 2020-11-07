import 'package:flutter_template/app/data/models/login/login_data.dart';
import 'package:flutter_template/app/data/providers/local/local_auth_provider.dart';

class LocalAuthRepository {
  final LocalAuthProvider _localAuthProvider = LocalAuthProvider();

  Future<void> setLoginData(LoginData loginData) =>
      _localAuthProvider.setLoginData(loginData);

  Future<LoginData> getLoginData() => _localAuthProvider.getLoginData();

  Future<void> cleanAll() => _localAuthProvider.cleanAllData();
}
