import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:olz/authManager/cache_manager.dart';

class AuthecticationManager extends GetxController with CacheManager {
  final isLoggedIn = false.obs;

  void logout() {
    isLoggedIn.value = false;
    removeToken();
  }

  void login(String token) async {
    print(token);
    isLoggedIn.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLoggedIn.value = true;
    }
  }
}
