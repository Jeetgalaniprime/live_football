import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:football_live/common/common_image.dart';
import 'package:football_live/common/common_loader.dart';
import 'package:football_live/screens/home_screen/controller/home_controller.dart';
import 'package:football_live/utils/app_assets.dart';
import 'package:football_live/utils/app_colors.dart';
import 'package:get/get.dart';

class PlayerDetailsScreen extends StatefulWidget {
  const PlayerDetailsScreen({super.key});

  @override
  State<PlayerDetailsScreen> createState() => _PlayerDetailsScreenState();
}

class _PlayerDetailsScreenState extends State<PlayerDetailsScreen> {
  final controller = Get.find<HomeScreenController>();

  @override
  void initState() {
    final playerId = Get.arguments;
    if (playerId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getPlayer(playerId);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CommonAppBar(title: 'Player Details'),
      body: Obx(() {
        double boxHeight = 25.h;
        double boxWidth = 25.w;
        final player = controller.player.value;
        if (player == null) {
          return CommonLoader();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Player image
                  CircleAvatar(
                    radius: 56,
                    backgroundImage: NetworkImage(
                      'http://static.holoduke.nl/footapi/images/playerimages/${player.id}.png',
                    ),
                    backgroundColor: Colors.grey[200],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age: ${player.age ?? "-"}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Nationality: ${player.nationality ?? "-"}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Birth Place: ${player.birthplace ?? "-"}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Position: ${player.position ?? "-"}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Team: ${player.team ?? "-"}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Weight: ${player.weight ?? "-"}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Height: ${player.height ?? "-"}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 90.w),
                  Image.asset(
                    AppAssets.footballImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                  Image.asset(
                    AppAssets.footballScoreYellowCardImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                  Image.asset(
                    AppAssets.redCardImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                  Image.asset(
                    AppAssets.footballScoreTimeClockImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                  Image.asset(
                    AppAssets.footballScoreSubInImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                  Image.asset(
                    AppAssets.footballScoreSubOutImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                  Image.asset(
                    AppAssets.lineupsImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                  Image.asset(
                    AppAssets.footballScoreBenchImage,
                    height: boxHeight,
                    width: boxWidth,
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: player.statistics.length,
                  itemBuilder: (context, index) {
                    final row = player.statistics[index];
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  row.season ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CommonNetworkImage(
                                  imageUrl:
                                      'http://static.holoduke.nl/footapi/images/teams_gs/${row.teamid}.png',
                                  height: 50.w,
                                  width: 50.w,
                                ),
                                Text(
                                  '${row.name} ${row.league}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              '${row.goals}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${row.yellowcards}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${row.redcards}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${row.minutes}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${row.substituteIn}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${row.substituteOut}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${row.lineups}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${row.substitutesOnBench}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _statIconText(IconData ic, String label) => Column(
    children: [
      Icon(ic, size: 18, color: Colors.black54),
      Text(label, style: const TextStyle(fontSize: 11, color: Colors.black87)),
    ],
  );
}
