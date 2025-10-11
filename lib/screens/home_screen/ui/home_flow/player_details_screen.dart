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
        final player = controller.player.value;
        if (player == null) return CommonLoader();

        final double statCellWidth =  34.w;
        final double statCellHeight = 34.h;
        final double seasonCellWidth = 80.w;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Nationality: ${player.nationality ?? "-"}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Birth Place: ${player.birthplace ?? "-"}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Position: ${player.position ?? "-"}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Team: ${player.team ?? "-"}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Weight: ${player.weight ?? "-"}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Height: ${player.height ?? "-"}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              // Header:
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: seasonCellWidth), // matches season cell
                  ...[
                    AppAssets.footballImage,
                    AppAssets.footballScoreYellowCardImage,
                    AppAssets.redCardImage,
                    AppAssets.footballScoreTimeClockImage,
                    AppAssets.footballScoreSubInImage,
                    AppAssets.footballScoreSubOutImage,
                    AppAssets.lineupsImage,
                    AppAssets.footballScoreBenchImage,
                  ].map(
                    (icon) => Container(
                      width: statCellWidth,
                      height: statCellHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 2.w),
                      child: Image.asset(
                        icon,
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  itemCount: player.statistics.length,
                  separatorBuilder: (_, __) => Divider(),
                  itemBuilder: (context, index) {
                    final row = player.statistics[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Season & logo cell (match header width)
                            SizedBox(
                              width: seasonCellWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    row.season ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CommonNetworkImage(
                                    imageUrl:
                                        'http://static.holoduke.nl/footapi/images/teams_gs/${row.teamid}.png',
                                    height: 36,
                                    width: 36,
                                  ),
                                ],
                              ),
                            ),
                            // Stat cells (must match icon header)
                            _statCell(
                              '${row.goals}',
                              statCellWidth,
                              statCellHeight,
                            ),
                            _statCell(
                              '${row.yellowcards}',
                              statCellWidth,
                              statCellHeight,
                            ),
                            _statCell(
                              '${row.redcards}',
                              statCellWidth,
                              statCellHeight,
                            ),
                            _statCell(
                              '${row.minutes}',
                              statCellWidth,
                              statCellHeight,
                            ),
                            _statCell(
                              '${row.substituteIn}',
                              statCellWidth,
                              statCellHeight,
                            ),
                            _statCell(
                              '${row.substituteOut}',
                              statCellWidth,
                              statCellHeight,
                            ),
                            _statCell(
                              '${row.lineups}',
                              statCellWidth,
                              statCellHeight,
                            ),
                            _statCell(
                              '${row.substitutesOnBench}',
                              statCellWidth,
                              statCellHeight,
                            ),
                          ],
                        ),
                        // Competition/club label
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            '${row.name ?? ""} ${row.league ?? ""}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
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

  Widget _statCell(String text, double width, double height) => Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    margin: EdgeInsets.only(right: 2.w),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
