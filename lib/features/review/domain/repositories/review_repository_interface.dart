import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rawabit_delivery_app/interface/repository_interface.dart';

abstract class ReviewRepositoryInterface implements RepositoryInterface {
  Future<Response> getReviewList(int offset, int isSaved);

  Future<Response> saveReview(int? reviewId, int isSaved);
}
