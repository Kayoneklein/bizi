part of '../index.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final Function onClickLogin;
  ForgotPasswordScreen({super.key, required this.onClickLogin});

  final emailController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StoreConnector<AppState, WelcomeModel>(
      converter: (Store<AppState> store) => WelcomeModel.fromStore(store),
      onInit: (Store<AppState> store) {
        store.dispatch(const SetUserErrorMessage(''));
        store.dispatch(const SetUserSuccessMessage(''));
      },
      builder: (_, viewModel) {
        return Form(
          key: formKey,
          child: viewModel.isLoading == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BiziTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: TextLocalization.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      filled: true,
                      cursorColor: BColors.white,
                      filledColor: BColors.veryLightGrey.withOpacity(0.2),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: BColors.white),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter valid email';
                        }
                        if (val.isValidEmail() == false) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const VerticalSpace(20),
                    Column(
                      children: [
                        if (viewModel.errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomText(
                              text: viewModel.errorMessage,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: BColors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        WelcomeButton(
                          text: TextLocalization.login,
                          icon: BIcons.email,
                          onTap: () {
                            if (formKey.currentState?.validate() == true) {}
                          },
                          borderRadius: 10,
                        ),
                        const VerticalSpace(10),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  BIcons.back,
                                  width: 19,
                                ),
                                const HorizontalSpace(5),
                                CustomText(
                                  text: TextLocalization.back,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: BColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Button(
                            onPressed: () {},
                            text: TextLocalization.forgotPassword,
                            color: BColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(color: BColors.white),
                ),
        );
      },
    );
  }
}
