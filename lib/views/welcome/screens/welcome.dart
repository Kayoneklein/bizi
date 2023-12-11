part of '../index.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool showLoginForm = false;
  bool showSignUpForm = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return StoreConnector<AppState, WelcomeModel>(
      converter: (Store<AppState> store) => WelcomeModel.fromStore(store),
      onInit: (Store<AppState> store) {
        store.dispatch(const SetUserErrorMessage(''));
        store.dispatch(const SetUserSuccessMessage(''));
      },
      builder: (_, viewModel) {
        return BiziAppWrapper(
          backgroundColor: SignInCarouselModel.activeSlider.color,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(BImages.welcome),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (MediaQuery.of(context).viewInsets.bottom < 1)
                              TopComponent(
                                setState: () {
                                  setState(() {});
                                },
                              ),
                            Expanded(
                              flex: 4,
                              child: ButtonSection(
                                showLoginForm: showLoginForm,
                                showSignUpForm: showSignUpForm,
                                onClickLogin: () {
                                  setState(() {
                                    showLoginForm = !showLoginForm;
                                    showSignUpForm = false;
                                  });
                                },
                                onClickSignup: () {
                                  setState(() {
                                    showLoginForm = false;
                                    showSignUpForm = !showSignUpForm;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (viewModel.errorMessage.isNotEmpty &&
                  showLoginForm == false &&
                  showSignUpForm == false)
                Positioned(
                  right: 20,
                  top: 20,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: size.width * 0.6,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: viewModel.errorMessage,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: BColors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
