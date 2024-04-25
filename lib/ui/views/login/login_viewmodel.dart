import 'package:busha/app/app.locator.dart';
import 'package:busha/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void toggleVisibility() {
    _obscureText = !_obscureText;
    rebuildUi();
  }

  Future<void> submit() async {
    await runBusyFuture(Future.delayed(const Duration(seconds: 3)));
    _navigationService.clearStackAndShow(Routes.wrapperView);
  }
}
