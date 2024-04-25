import 'package:busha/data_models/transactions_data_model.dart';
import 'package:busha/ui/common/ui_helpers.dart';
import 'package:busha/ui/views/transaction_details/widgets/content_holder.dart';
import 'package:busha/ui/widgets/common/custom_back_buttom/custom_back_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';

import 'transaction_details_viewmodel.dart';

class TransactionDetailsView extends StackedView<TransactionDetailsViewModel> {
  final TransactionsDataModel tx;
  const TransactionDetailsView({
    Key? key,
    required this.tx,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TransactionDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: const CustomBackButtom(),
        title: const Text(
          "Transaction details",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: screenPadding,
        children: [
          ContentHolder(
            title: 'Hash',
            value: tx.hash ?? '',
          ),
          spacedDivider,
          ContentHolder(
            title: 'Time',
            value:
                '${Jiffy.parseFromDateTime(tx.converted).format(pattern: 'yyyy-mm-dd')} • ${Jiffy.parseFromDateTime(tx.converted).format(pattern: 'HH:mm')}',
          ),
          spacedDivider,
          ContentHolder(
            title: 'Size',
            value: tx.size?.toString() ?? '',
          ),
          spacedDivider,
          ContentHolder(
            title: 'Block index',
            value: tx.blockIndex?.toString() ?? '',
          ),
          spacedDivider,
          ContentHolder(
            title: 'Height',
            value: tx.blockHeight?.toString() ?? '',
          ),
          spacedDivider,
          const ContentHolder(
            title: 'Received time',
            value: '2019-08-24 • 15:43',
          ),
          verticalSpace(40),
          ListTile(
            leading: SvgPicture.asset(
              'assets/svg/external_link_icon.svg',
              height: 24,
              width: 24,
            ),
            title: const Text(
              'View on blockchain explorer',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            trailing: SvgPicture.asset(
              'assets/svg/forward_icon.svg',
              height: 12,
              width: 12,
            ),
            onTap: viewModel.openExternalLink,
          ),
        ],
      ),
    );
  }

  @override
  TransactionDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactionDetailsViewModel();
}
