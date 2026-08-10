import 'package:get/get.dart';
import 'package:rawabit_delivery_app/features/splash/controllers/splash_controller.dart';
import 'package:rawabit_delivery_app/common/basewidgets/custom_snackbar_widget.dart';
import 'package:rawabit_delivery_app/features/auth/screens/login_screen.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Get.find<SplashController>().removeSharedData();
      Get.to(() => const LoginScreen());
    } else {
      showCustomSnackBarWidget(response.statusText);
    }
  }
}
