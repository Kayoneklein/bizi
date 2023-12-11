part of '../index.dart';

class SignUpForm extends StatefulWidget {
  final Function onTap;
  const SignUpForm({super.key, required this.onTap});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final fnController = TextEditingController(text: '');
  final lnController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

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
              ? Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BiziTextField(
                            controller: fnController,
                            textCapitalization: TextCapitalization.words,
                            hintText: TextLocalization.firstName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            width: MediaQuery.of(context).size.width * 0.4,
                            filled: true,
                            cursorColor: BColors.white,
                            filledColor: BColors.veryLightGrey.withOpacity(0.2),
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: BColors.white),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return TextLocalization.enterFirstName;
                              }
                              return null;
                            },
                          ),
                          BiziTextField(
                            controller: lnController,
                            hintText: TextLocalization.lastName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textCapitalization: TextCapitalization.words,
                            width: MediaQuery.of(context).size.width * 0.4,
                            filled: true,
                            cursorColor: BColors.white,
                            filledColor: BColors.veryLightGrey.withOpacity(0.2),
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: BColors.white),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return TextLocalization.enterLastName;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const VerticalSpace(10),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            CustomText(
                              text: viewModel.errorMessage,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: BColors.red,
                              ),
                            ),
                          WelcomeButton(
                            text: TextLocalization.createAccount,
                            icon: BIcons.email,
                            onTap: () {
                              if (formKey.currentState?.validate() == true) {
                                viewModel.signup(
                                  password: passwordController.text.trim(),
                                  email: emailController.text.trim(),
                                  firstName: fnController.text.trim(),
                                  lastName: lnController.text.trim(),
                                );
                              }
                            },
                            borderRadius: 10,
                          ),
                          const VerticalSpace(10),
                          InkWell(
                            onTap: () => widget.onTap(),
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
                        ],
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(color: BColors.white),
        );
      },
    );
  }
}
