part of '../index.dart';

class CampaignListCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const CampaignListCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(
          image,
          width: 44,
          height: 41,
        ),
        title: CustomText(
          text: title,
        ),
        subtitle: CustomText(
          text: subtitle,
        ),
        trailing: const Icon(
          Icons.redo,
          size: 20,
          color: BColors.blue,
        ),
      ),
    );
  }
}
