part of '../index.dart';

class TextComponentEdit extends StatelessWidget {
  final String? textToEdit;
  final RowProperty? property;
  final int? rowIndex;
  final CampaignBuilderViewModel pageModel;
  const TextComponentEdit({
    super.key,
    required this.pageModel,
    required this.rowIndex,
    required this.property,
    required this.textToEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Material(
        elevation: 4,
        color: BColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiziTextField(
              hintText: textToEdit,
              initialValue: textToEdit ?? '',
              maxLines: 12,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              width: MediaQuery.of(context).size.width * 0.9,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onChanged: (val) {
                if (property == RowProperty.subtitle) {
                  pageModel.editRowSubtitle(val, rowIndex!);
                }
                if (property == RowProperty.description) {
                  pageModel.editRowDescription(val, rowIndex!);
                }
              },
            ),
            const VerticalSpace(20),
            DeleteTextField(
              deleteTextField: () {
                pageModel.toggleTextEditPanel(false);
                pageModel.deleteRowProperty(property!, rowIndex!);
              },
            )
          ],
        ),
      ),
    );
  }
}
