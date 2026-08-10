import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rawabit_delivery_app/interface/repository_interface.dart';

abstract class WalletRepositoryInterface implements RepositoryInterface {
  Future<Response> getDeliveryWiseEarned({
    String? startDate,
    String? endDate,
    int? offset,
    String? type,
  });
  Future<Response> getDepositedList({
    String? startDate,
    String? endDate,
    int? offset,
    String? type,
  });
}
