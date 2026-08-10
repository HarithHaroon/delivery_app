import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawabit_delivery_app/features/wallet/controllers/wallet_controller.dart';
import 'package:rawabit_delivery_app/common/basewidgets/no_data_screen_widget.dart';
import 'package:rawabit_delivery_app/features/wallet/widgets/transaction_card_widget.dart';

import 'transaction_card_shimmer_widget.dart';

class TransactionListViewWidget extends StatelessWidget {
  const TransactionListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      builder: (walletController) {
        return !walletController.isLoading
            ? walletController.deliveryWiseEarned.isNotEmpty
                  ? ListView.builder(
                      itemCount: walletController.deliveryWiseEarned.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (transactionContext, transactionIndex) =>
                          TransactionCardWidget(
                            orders: walletController
                                .deliveryWiseEarned[transactionIndex],
                            index: transactionIndex,
                            length: walletController.deliveryWiseEarned.length,
                          ),
                    )
                  : const NoDataScreenWidget()
            : const TransactionCardShimmerWidget();
      },
    );
  }
}
