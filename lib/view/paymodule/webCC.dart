import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sreshtgeeth/controller/auth.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webCC extends StatefulWidget {


  webCC( {Key? key, }) : super(key: key);



  @override
  State<webCC> createState() => _webCCState();
}

class _webCCState extends State<webCC> {
  // var payUrl = '';
  // var controller =;
  AuthCon acon1 = Get.put(AuthCon());
  late WebViewController controller;



  // callingg()async{
  //   await acon1.paymentpage2(widget.planid);
  //   setState(() {
  //
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // callingg();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print(url);
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(
                acon1.pay1!.paymentLink)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse(acon1.pay1!.paymentLink));
  }

  @override
  void dispose() {
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Payment')),
          body: WebViewWidget(controller: controller),
        ));
  }
}

// WebViewWidget(
// controller: WebViewController()
// ..setJavaScriptMode(JavaScriptMode.unrestricted)
// ..setBackgroundColor(const Color(0x00000000))
// ..setNavigationDelegate(
// NavigationDelegate(
// onProgress: (int progress) {
// // Update loading bar.
// },
// onPageStarted: (String url) {},
// onPageFinished: (String url) {},
// onWebResourceError: (WebResourceError error) {},
// onNavigationRequest: (NavigationRequest request) {
// if (request.url.startsWith('https://www.youtube.com/')) {
// return NavigationDecision.prevent;
// }
// return NavigationDecision.navigate;
// },
// ),
// )
// ..loadRequest(Uri.parse(widget.paymentLink))),