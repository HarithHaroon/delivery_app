import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rawabit_delivery_app/data/api/api_checker.dart';
import 'package:rawabit_delivery_app/features/onboard/domain/models/onboarding_model.dart';
import 'package:rawabit_delivery_app/features/onboard/domain/repositories/onbording_repository_interface.dart';
import 'package:rawabit_delivery_app/features/onboard/domain/services/onboard_service_interface.dart';

class OnboardService implements OnboardServiceInterface {
  OnboardRepositoryInterface onboardRepoInterface;
  OnboardService({required this.onboardRepoInterface});

  @override
  Future getOnBoardingList() async {
    Response response = await onboardRepoInterface.getList();
    List<OnBoardingModel> onBoardingList = [];
    if (response.statusCode == 200) {
      onBoardingList = [];
      onBoardingList.addAll(response.body);
    } else {
      ApiChecker.checkApi(response);
    }
    return onBoardingList;
  }
}
