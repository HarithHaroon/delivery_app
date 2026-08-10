import 'package:flutter/material.dart';
import 'package:rawabit_delivery_app/theme/controllers/theme_controller.dart';
import 'package:rawabit_delivery_app/features/order/domain/models/order_model.dart';
import 'package:rawabit_delivery_app/utill/dimensions.dart';
import 'package:rawabit_delivery_app/utill/images.dart';
import 'package:rawabit_delivery_app/utill/styles.dart';
import 'package:get/get.dart';
import 'package:rawabit_delivery_app/features/order/widgets/order_item_info_widget.dart';

class DeliveryInfoWidget extends StatelessWidget {
  final OrderModel? orderModel;
  final int? index;
  const DeliveryInfoWidget({super.key, this.orderModel, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.rememberMeSizeDefault,
        vertical: Dimensions.paddingSizeMin,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeChat),
        boxShadow: [
          BoxShadow(
            color: Get.find<ThemeController>().darkTheme
                ? Colors.black.withValues(alpha: 0.10)
                : Colors.grey[100]!,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 20, child: Image.asset(Images.customerIcon)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall,
                  vertical: Dimensions.paddingSizeDefault,
                ),
                child: Text(
                  'delivery_info'.tr,
                  style: rubikMedium.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: Dimensions.fontSizeLarge,
                  ),
                ),
              ),
            ],
          ),

          (orderModel!.shippingAddress?.contactPersonName != null &&
                      orderModel!
                          .shippingAddress!
                          .contactPersonName!
                          .isNotEmpty) &&
                  (orderModel!.shippingAddress?.phone != null &&
                      orderModel!.shippingAddress!.phone!.isNotEmpty) &&
                  (orderModel!.shippingAddress != null)
              ? Column(
                  children: [
                    OrderItemInfoWidget(
                      title: 'name',
                      info:
                          orderModel!.shippingAddress?.contactPersonName ?? '',
                      textStyle: rubikMedium.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),

                    OrderItemInfoWidget(
                      title: 'contact',
                      info: orderModel!.shippingAddress?.phone ?? '',
                      textStyle: rubikMedium.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),

                    OrderItemInfoWidget(
                      title: 'location',
                      info: orderModel!.shippingAddress != null
                          ? '${orderModel!.shippingAddress?.address}${orderModel!.shippingAddress?.city != null ? ',' : ''}  '
                                '${orderModel!.shippingAddress?.city ?? ''}${orderModel!.shippingAddress?.zip != null ? ',' : ''} '
                                '${orderModel!.shippingAddress?.zip ?? ''}'
                          : '',
                      textStyle: rubikMedium.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),

          SizedBox(height: Dimensions.paddingSizeDefault),
        ],
      ),
    );
  }
}
