part of '../index.dart';

class DeleteComponentButton extends StatelessWidget {
  final double width;
  final double height;
  final Function() onTap;
  const DeleteComponentButton({
    super.key,
    this.width = 100,
    this.height = 30,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: BColors.redBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: TextLocalization.delete,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: BColors.darkOrange,
                  fontSize: 14.0,
                ),
              ),
              const Icon(
                Icons.delete_forever_rounded,
                color: BColors.darkOrange,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
