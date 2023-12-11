part of '../index.dart';

class DeleteTextField extends StatelessWidget {
  final Function() deleteTextField;
  const DeleteTextField({
    super.key,
    required this.deleteTextField,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Button(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: CustomText(
                text: TextLocalization
                    .areYouSureYouWantToDeleteTheEntireTextField,
                style: theme.textTheme.headlineSmall,
              ),
              actions: [
                Button(
                  onPressed: () {
                    Navigator.pop(ctx);
                    deleteTextField();
                  },
                  text: TextLocalization.yes,
                ),
                Button(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  text: TextLocalization.no,
                ),
              ],
            );
          },
        );
      },
      text: TextLocalization.delete,
      backgroundColor: BColors.red,
      color: BColors.white,
      size: const Size(100, 20),
    );
  }
}
