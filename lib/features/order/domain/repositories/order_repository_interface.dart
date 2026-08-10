import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rawabit_delivery_app/interface/repository_interface.dart';

abstract class OrderRepositoryInterface implements RepositoryInterface {
  Future<Response> getCurrentOrders();
  Future<Response> getAllOrderHistory(
    String dateType,
    String type,
    String startDate,
    String endDate,
    String search,
    int isPause,
  );
  Future<Response> getSingleOrderHistory(String id);
}
