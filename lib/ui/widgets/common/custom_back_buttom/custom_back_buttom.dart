import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'custom_back_buttom_model.dart';

class CustomBackButtom extends StackedView<CustomBackButtomModel> {
  const CustomBackButtom({super.key});

  @override
  Widget builder(
    BuildContext context,
    CustomBackButtomModel viewModel,
    Widget? child,
  ) {
    return IconButton(
      onPressed: viewModel.popPage,
      icon: SvgPicture.asset(
        'assets/svg/back_icon.svg',
        height: 16,
        width: 16,
      ),
    );
  }

  @override
  CustomBackButtomModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomBackButtomModel();
}
