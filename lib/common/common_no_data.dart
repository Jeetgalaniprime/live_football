import 'package:flutter/material.dart';

class CommonNoDataWidget extends StatefulWidget {
  const CommonNoDataWidget({super.key});

  @override
  State<CommonNoDataWidget> createState() => _CommonNoDataWidgetState();
}

class _CommonNoDataWidgetState extends State<CommonNoDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Image.asset(
      //   AppAssets.noDataImage,
      //   width:  300.w,
      //   height: 300.h,
      // ),
    );
  }
}