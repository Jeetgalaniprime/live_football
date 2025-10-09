import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

final double commonWidth = MediaQuery.sizeOf(Get.context!).width;

final double commonHeight = MediaQuery.sizeOf(Get.context!).height;

Future launchCustomUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
