import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'portfolio_viewmodel.dart';

class PortfolioView extends StackedView<PortfolioViewModel> {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PortfolioViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          'Portfolio View',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  @override
  PortfolioViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PortfolioViewModel();
}
