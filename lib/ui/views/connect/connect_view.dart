import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'connect_viewmodel.dart';

class ConnectView extends StackedView<ConnectViewModel> {
  const ConnectView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConnectViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text(
          'Connect View',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  @override
  ConnectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConnectViewModel();
}
