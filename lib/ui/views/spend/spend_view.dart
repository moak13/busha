import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'spend_viewmodel.dart';

class SpendView extends StackedView<SpendViewModel> {
  const SpendView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpendViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          'Spend View',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  @override
  SpendViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SpendViewModel();
}
