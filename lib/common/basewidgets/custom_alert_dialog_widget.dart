import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawabit_delivery_app/common/basewidgets/custom_button_widget.dart';
import 'package:rawabit_delivery_app/utill/dimensions.dart';
import 'package:rawabit_delivery_app/utill/styles.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  final String description;
  final Function onOkPressed;
  const CustomAlertDialogWidget({
    super.key,
    required this.description,
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
          vertical: Dimensions.paddingSizeSmall,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info, size: 80, color: Theme.of(context).primaryColor),

            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge),
              ),
            ),

            CustomButtonWidget(btnTxt: 'ok'.tr, onTap: onOkPressed),
          ],
        ),
      ),
    );
  }
}
