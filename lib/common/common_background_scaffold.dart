import 'package:flutter/material.dart';
import 'package:football_live/utils/app_assets.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;

  const BackgroundScaffold({Key? key, required this.child, this.appBar})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Foreground content
          child,
        ],
      ),
    );
  }
}
