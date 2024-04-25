import 'package:busha/ui/common/ui_helpers.dart';
import 'package:busha/ui/views/explore/explore_viewmodel.dart';
import 'package:busha/ui/views/explore/widgets/assets_card.dart';
import 'package:busha/ui/views/explore/widgets/busy_assets_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AssetsSection extends ViewModelWidget<ExploreViewModel> {
  const AssetsSection({super.key});

  @override
  Widget build(BuildContext context, ExploreViewModel viewModel) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        if (viewModel.fetchingAssets) {
          return SliverList.separated(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const BusyAssetsCard();
            },
            separatorBuilder: (context, index) {
              return verticalSpace(16);
            },
          );
        }

        return SliverList.separated(
          itemCount: viewModel.assetsList.length,
          itemBuilder: (context, index) {
            final assets = viewModel.assetsList.elementAt(index);
            return AssetsCard(
              assets: assets,
              onTap: () {
                viewModel.moveToTransactionsView(asset: assets);
              },
            );
          },
          separatorBuilder: (context, index) {
            return verticalSpace(16);
          },
        );
      },
    );
  }
}
