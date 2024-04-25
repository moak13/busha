import 'package:busha/ui/common/ui_helpers.dart';
import 'package:busha/ui/widgets/common/custom_back_buttom/custom_back_buttom.dart';
import 'package:busha/ui/widgets/common/overlay_loader.dart';
import 'package:busha/utilities/string_util.dart';
import 'package:busha/utilities/validator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';
import 'widgets/primary_button.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: OverlayLoader(
          isBusy: viewModel.isBusy,
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: CustomBackButtom(),
                ),
                verticalSpace(20),
                Expanded(
                  child: ListView(
                    padding: screenPadding,
                    children: [
                      const Text(
                        'Log in to your account',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace(8),
                      const Text(
                        'Welcome back! Please enter your registered email address to continue',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      verticalSpace(24),
                      const Text(
                        'Email address',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                      verticalSpace(4),
                      TextFormField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffEFEFEF),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorScheme.error,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                        ),
                        validator: (value) => Validator.validateEmail(value),
                        onFieldSubmitted: (value) {
                          if (StringUtil.isNotEmpty(value)) {
                            passwordFocusNode.requestFocus();
                          }
                        },
                      ),
                      verticalSpace(16),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                      verticalSpace(4),
                      TextFormField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: viewModel.obscureText,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffEFEFEF),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.colorScheme.error,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                          suffixIcon: Builder(builder: (context) {
                            if (viewModel.obscureText) {
                              return TextButton(
                                onPressed: viewModel.toggleVisibility,
                                child: const Text(
                                  'SHOW',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff5A5A5A),
                                  ),
                                ),
                              );
                            }

                            return TextButton(
                              onPressed: viewModel.toggleVisibility,
                              child: const Text(
                                'HIDE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xff5A5A5A),
                                ),
                              ),
                            );
                          }),
                        ),
                        validator: (value) => Validator.validatePassword(value),
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                  onTap: () {
                    if (viewModel.formKey.currentState?.validate() ?? false) {
                      viewModel.submit();
                    }
                  },
                ),
                verticalSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
