import 'package:flutter/material.dart';
import 'package:football_live/models/team_details_model.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class TransferWidget extends GetView<HomeScreenController> {
  const TransferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final team = controller.teamDetails.value;
    final List<In> inTransfers = team?.transfers?.transfersIn ?? [];
    final List<In> outTransfers = team?.transfers?.transferOut ?? [];

    // Instead of checking any field, use the list key!
    final allTransfers = [
      ...inTransfers.map((t) => MapEntry(t, true)),
      ...outTransfers.map((t) => MapEntry(t, false)),
    ];
    for (final entry in allTransfers) {
      debugPrint("Transfer: ${entry.key.name}, isIn: ${entry.value}");
    }

    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    if (allTransfers.isEmpty) {
      return const Center(child: Text("No transfer data"));
    }

    return ListView.builder(
      itemCount: allTransfers.length,
      itemBuilder: (context, index) {
        final map = allTransfers[index];
        final transfer = map.key;
        final isIn = map.value;

        final playerImage =
            "http://static.holoduke.nl/footapi/images/playerimages/${transfer.id}.png";
        // final arrowIcon = isIn
        //     ? AppAssets.incomingTransferImage
        //     : AppAssets.outgoingTransferImage;
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(backgroundImage: NetworkImage(playerImage)),
                const SizedBox(width: 8),
                isIn
                    ? Icon(Icons.arrow_back_rounded, color: AppColors.greenColor,)
                    : Icon(Icons.arrow_forward_rounded, color: AppColors.redColor,),
                // Image.asset(
                //   isIn
                //       ? AppAssets.incomingTransferImage
                //       : AppAssets.outgoingTransferImage,
                //   color: AppColors.primaryColor,
                //   width: 24,
                //   height: 24,
                // ),
              ],
            ),
            title: Text(
              transfer.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(transfer.date ?? ''),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isIn ? (transfer.from ?? '') : (transfer.to ?? ''),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(transfer.type ?? '', style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        );
      },
    );
  }
}
