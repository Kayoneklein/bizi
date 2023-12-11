part of '../index.dart';

class ImageSearchField extends StatelessWidget {
  final CampaignBuilderViewModel pageModel;
  const ImageSearchField({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: '');
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16.0,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        onEditingComplete: () {
          if (controller.text.isNotEmpty == true) {
            if (pageModel.imageBuilderDisplay ==
                ImageBuilderDisplayType.pexels) {
              pageModel.searchPexelImages(controller.text);
            }
            if (pageModel.imageBuilderDisplay ==
                ImageBuilderDisplayType.unsplash) {
              pageModel.searchUnsplashImages(controller.text);
            }
          }
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          hintText: TextLocalization.search,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          fillColor: BColors.lightGrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: BColors.lightGrey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: BColors.lightGrey,
            ),
          ),
        ),
      ),
    );
  }
}
