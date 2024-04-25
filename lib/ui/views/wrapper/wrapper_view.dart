import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'widgets/get_view_by_index.dart';
import 'wrapper_viewmodel.dart';

class WrapperView extends StackedView<WrapperViewModel> {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WrapperViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GetViewByIndex(
        index: viewModel.currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/explore_icon.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/active_explore_icon.svg',
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/portfolio_icon.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/active_portfolio_icon.svg',
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/earn_icon.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/active_earn_icon.svg',
            ),
            label: 'Earn',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/spend_icon.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/active_spend_icon.svg',
            ),
            label: 'Spend',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/connect_icon.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/active_connect_icon.svg',
            ),
            label: 'Connect',
          ),
        ],
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
      ),
    );
  }

  @override
  WrapperViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WrapperViewModel();
}
