import 'package:flutter/material.dart';
import 'package:football_live/common/common_appbar.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late final WebViewController _controller;
  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();

    final link =
        Get.arguments['link'] ?? 'https://www.google.com/search?q=news';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => isLoading.value = true,
          onPageFinished: (_) {},
          onWebResourceError: (error) {
            isLoading.value = false;
            debugPrint('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(link));
    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments['title'] ?? 'News Details';
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          Obx(
            () => isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
