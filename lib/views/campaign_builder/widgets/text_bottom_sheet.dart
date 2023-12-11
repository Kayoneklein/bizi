part of '../index.dart';

class TextBottomSheet extends StatelessWidget {
  final String text;
  final Function(String) editText;
  const TextBottomSheet({
    super.key,
    required this.text,
    required this.editText,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final double bottom = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: bottom + size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
        child: Column(
          children: [
            BiziTextField(
              hintText: TextLocalization.text,
              initialValue: text,
              onChanged: (val) {
                editText(val);
              },
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: BColors.grey,
                fontStyle: FontStyle.italic,
              ),
              filledColor: BColors.veryLightGrey,
              filled: true,
            ),
            VerticalSpace(bottom == 0 ? 30 : 20),
            Button(
              onPressed: () => Get.back(),
              text: TextLocalization.done,
              backgroundColor: BColors.blue,
              color: BColors.white,
              borderRadius: 8,
              size: Size(size.width, 40),
            ),
          ],
        ),
      ),
    );
  }
}
