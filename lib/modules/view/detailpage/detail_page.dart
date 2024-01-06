import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:government_services_app/modules/model/gov_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late InAppWebViewController inAppWebViewController;
  late PullToRefreshController pullToRefreshController;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: Colors.red),
      onRefresh: () {
        inAppWebViewController.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GovModel govServiceData =
        ModalRoute.of(context)!.settings.arguments as GovModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(govServiceData.name),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () async {
                if (await inAppWebViewController.canGoBack()) {
                  await inAppWebViewController.goBack();
                }
              },
              icon: const Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: () async {
                await inAppWebViewController.reload();
              },
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () async {
                await inAppWebViewController.loadUrl(
                  urlRequest: URLRequest(
                    url: WebUri(govServiceData.link),
                  ),
                );
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () async {
                if (await inAppWebViewController.canGoForward()) {
                  await inAppWebViewController.goForward();
                }
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      body: InAppWebView(
        pullToRefreshController: pullToRefreshController,
        initialUrlRequest: URLRequest(
          url: WebUri(govServiceData.link),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          setState(() {
            inAppWebViewController = controller;
          });
        },
        onLoadStop: (controller, uri) async {
          await pullToRefreshController.endRefreshing();
        },
      ),
    );
  }
}
