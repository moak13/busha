import 'package:busha/data_models/assets_data_model.dart';
import 'package:busha/ui/common/ui_helpers.dart';
import 'package:busha/ui/widgets/common/custom_back_buttom/custom_back_buttom.dart';
import 'package:busha/ui/widgets/common/overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';

import 'transactions_viewmodel.dart';

class TransactionsView extends StackedView<TransactionsViewModel> {
  final AssetsDataModel assets;
  const TransactionsView({
    Key? key,
    required this.assets,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TransactionsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: const CustomBackButtom(),
        title: Text(
          "${assets.shortHand} transactions",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (viewModel.isBusy) {
            return OverlayLoader(
              isBusy: viewModel.isBusy,
              child: const SizedBox.shrink(),
            );
          }

          if (viewModel.hasError) {
            return Center(
              child: Text(
                viewModel.modelMessage ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              final tx = viewModel.data?.tx?.elementAt(index);
              return ListTile(
                title: Text(
                  tx?.hash ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    text:
                        Jiffy.parseFromDateTime(tx?.converted ?? DateTime.now())
                            .format(pattern: 'yyyy-mm-dd'),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                    children: [
                      const TextSpan(text: ' '),
                      const TextSpan(text: '•'),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: Jiffy.parseFromDateTime(
                                tx?.converted ?? DateTime.now())
                            .format(pattern: 'HH:mm'),
                      )
                    ],
                  ),
                ),
                trailing: SvgPicture.asset(
                  'assets/svg/forward_icon.svg',
                  height: 12,
                  width: 12,
                ),
                onTap: () {
                  viewModel.moveToTransactionDetails(tx: tx);
                },
              );
            },
            separatorBuilder: (context, index) {
              return spacedDivider;
            },
            itemCount: viewModel.data?.tx?.length ?? 0,
          );
        },
      ),
    );
  }

  @override
  TransactionsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactionsViewModel(
        blockHash: assets.blockHash,
      );
}
