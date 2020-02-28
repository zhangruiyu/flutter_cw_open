import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/back_button_arrows.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';
import 'package:webview_flutter/webview_flutter.dart';

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}

Widget buildView(
    WebviewState state, Dispatch dispatch, ViewService viewService) {
  return WillPopScope(
    onWillPop: () async {
      var webViewController = (await state.controller.future);
      if (await webViewController.canGoBack()) {
        webViewController.goBack();
        return Future.value(false);
      }
      return Future.value(true);
    },
    child: Scaffold(
      appBar: Toolbar(
        leading: Row(
          children: <Widget>[
            BackButtonArrows(
              color: colorWhite,
            ),
          ],
        ),
        title: Text(
          state.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.close),
              tooltip: MaterialLocalizations.of(viewService.context)
                  .backButtonTooltip,
              onPressed: () {
                Navigator.pop(viewService.context);
              })
        ],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: state.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            state.controller.complete(webViewController);
          },
          // TODO(iskakaushik): Remove this when collection literals makes it to stable.
          // ignore: prefer_collection_literals
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
          ].toSet(),
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        );
      }),
      /*floatingActionButton: FutureBuilder<WebViewController>(
          future: state.controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                onPressed: () async {
                  final String url = await controller.data.currentUrl();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Favorited $url')),
                  );
                },
                child: const Icon(Icons.favorite),
              );
            }
            return Container();
          }),*/
    ),
  );
}
