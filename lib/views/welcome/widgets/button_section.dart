part of '../index.dart';

class ButtonSection extends StatelessWidget {
  final Function onClickSignup;
  final Function onClickLogin;
  final bool showSignUpForm;
  final bool showLoginForm;
  const ButtonSection({
    super.key,
    required this.onClickLogin,
    required this.onClickSignup,
    required this.showLoginForm,
    required this.showSignUpForm,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return StoreConnector<AppState, WelcomeModel>(
      converter: (Store<AppState> store) => WelcomeModel.fromStore(store),
      builder: (_, viewModel) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (showLoginForm == true)
                      SignInForm(onClickLogin: () => onClickLogin()),
                    if (showSignUpForm == true)
                      SignUpForm(onTap: () => onClickSignup()),
                    if (showSignUpForm == false && showLoginForm == false)
                      Column(
                        children: [
                          WelcomeButton(
                            text: TextLocalization.signUpWithEmail,
                            icon: BIcons.email,
                            onTap: () => onClickSignup(),
                          ),
                          WelcomeButton(
                            text: TextLocalization.signInWithApple,
                            icon: BIcons.apple,
                            onTap: () => viewModel.signInWithApple(),
                          ),
                          WelcomeButton(
                            text: TextLocalization.signInWithGoogle,
                            icon: BIcons.google,
                            onTap: () => viewModel.signInWithGoogle(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.02,
                              bottom: size.height * 0.01,
                            ),
                            child: CustomText(
                              text: TextLocalization.or.toUpperCase(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: BColors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Button(
                            onPressed: () => onClickLogin(),
                            text: TextLocalization.loginWithEmail.toUpperCase(),
                            textStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: BColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            color: BColors.white,
                            borderRadius: 10.0,
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            if (showLoginForm == false)
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 25,
                  right: 25,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: TextLocalization.byJoiningThisApp,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: BColors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: TextLocalization.our,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: BColors.white,
                        ),
                      ),
                      TextSpan(
                        text: TextLocalization.termsAndConditions,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: BColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              builder: (ctx) {
                                return const TermsAndCondition();
                              },
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
