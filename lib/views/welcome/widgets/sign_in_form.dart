part of '../index.dart';

class SignInForm extends StatefulWidget {
  final Function onClickLogin;
  const SignInForm({super.key, required this.onClickLogin});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final fnController = TextEditingController(text: '');
  final lnController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final fgtEmailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool showForgotPassword = false;

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
                    if (showForgotPassword == false)
                      Column(
                        children: [
                          BiziTextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: TextLocalization.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            filled: true,
                            cursorColor: BColors.white,
                            filledColor: BColors.veryLightGrey.withOpacity(0.2),
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: BColors.white),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return TextLocalization.enterValidEmail;
                              }
                              if (val.isValidEmail() == false) {
                                return TextLocalization.enterValidEmail;
                              }
                              return null;
                            },
                          ),
                          const VerticalSpace(10),
                          BiziTextField(
                            controller: passwordController,
                            hintText: TextLocalization.password,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: obscureText,
                            filled: true,
                            cursorColor: BColors.white,
                            filledColor: BColors.veryLightGrey.withOpacity(0.2),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.visibility_off_rounded,
                                color: BColors.white,
                              ),
                            ),
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: BColors.white),
                            validator: (val) => validatePassword(val),
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
                                  if (formKey.currentState?.validate() ==
                                      true) {
                                    viewModel.signIn(
                                      password: passwordController.text.trim(),
                                      email: emailController.text.trim(),
                                    );
                                  }
                                },
                                borderRadius: 10,
                              ),
                              _BackButton(onTap: () => widget.onClickLogin()),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Button(
                                  onPressed: () {
                                    setState(() {
                                      showForgotPassword = true;
                                    });
                                  },
                                  text: TextLocalization.forgotPassword,
                                  color: BColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (showForgotPassword)
                      Column(
                        children: [
                          BiziTextField(
                            controller: fgtEmailController,
                            hintText: TextLocalization.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            filled: true,
                            cursorColor: BColors.white,
                            filledColor: BColors.veryLightGrey.withOpacity(0.2),
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: BColors.white),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return TextLocalization.enterValidEmail;
                              }
                              if (val.isValidEmail() == false) {
                                return TextLocalization.enterValidEmail;
                              }
                              return null;
                            },
                          ),
                          const VerticalSpace(30),
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
                          if (viewModel.successMessage.isNotEmpty)
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: CustomText(
                                  text: viewModel.successMessage,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: BColors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          const VerticalSpace(30),
                          WelcomeButton(
                            text: TextLocalization.sendResetEmail,
                            icon: BIcons.email,
                            fontWeight: FontWeight.bold,
                            onTap: () {
                              if (formKey.currentState?.validate() == true) {
                                viewModel.forgotPassword(
                                    fgtEmailController.text.trim());
                              }
                            },
                            borderRadius: 10,
                          ),
                          _BackButton(
                            onTap: () {
                              setState(() {
                                showForgotPassword = false;
                              });
                            },
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

class _BackButton extends StatelessWidget {
  final Function onTap;
  const _BackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => onTap(),
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
    );
  }
}
