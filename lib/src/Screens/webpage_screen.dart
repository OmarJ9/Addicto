import 'dart:io';
import 'package:addicto/src/Config/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageScreen extends StatefulWidget {
  final String website;
  const WebPageScreen({super.key, required this.website});

  @override
  State<WebPageScreen> createState() => _WebPageScreenState();
}

class _WebPageScreenState extends State<WebPageScreen> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier * 5,
                  horizontal: SizeConfig.widthMultiplier * 5,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 3,
                    ),
                    Text(
                      'Addicto Webview',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: SizeConfig.textMultiplier * 2.3,
                          ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: SizeConfig.heightMultiplier * 4,
              // ),
              Expanded(
                child: WebView(
                  initialUrl: widget.website,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              )
            ],
          )),
    );
  }
}
