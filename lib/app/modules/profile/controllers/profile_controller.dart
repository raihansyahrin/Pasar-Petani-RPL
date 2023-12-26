import 'package:get/get.dart';
import 'package:pasar_petani/app/services/authentication_service.dart';

import '../../../data/model/user.dart';
import '../../../routes/app_pages.dart';
import '../../../services/user_service.dart';

class ProfileController extends GetxController {
  User? user;
  bool? isLoading = false;
  @override
  void onInit() {
    fetchUser();
    super.onInit();

  }

  Future<void> fetchUser() async {
    user = await UserService().fetchUser();
    update();
    isLoading = false;
  }

  void logout() async {
    if (await AuthenticationService().logout()) {
      Get.back();
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
