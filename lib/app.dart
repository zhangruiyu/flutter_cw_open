import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';

import 'constants/constants.dart';
import 'global_store/store.dart';
import 'helper/user_helper.dart';
import 'localizetion/fallback_cupertino_localisations_delegate.dart';
import 'localizetion/localizations_delegate.dart';
import 'widget/no_scale_text_widget.dart';

Future<Widget> createApp() async {
  //初始化用户数据
  var initLocalUser = await UserHelper.initLocalUser();
  GlobalStore.store.getState().localUser = initLocalUser;
  return OKToast(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: GlobalStore.store.getState().locale,
      onGenerateTitle: (BuildContext context) {
        return DefaultLocalizations.of(context).appName;
      },
      localizationsDelegates: [
        FallbackCupertinoLocalisationsDelegate(),
        const DefaultLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', ''),
        const Locale('en', ''),
        // ... other locales the app supports
      ],
//    theme: themeProvide.themeData,
      theme: ThemeData(
          platform: TargetPlatform.iOS,
          primaryColor: Color(0xffFFC000),
          accentColor: Color(0xffFFC000),
          dividerColor: colorf3f3f3),
      home: routes.buildPage(PageConstants.SplashPage, null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(
            builder: (BuildContext context) {
              return routes.buildPage(settings.name, settings.arguments);
            },
            settings: RouteSettings(name: settings.name));
      },
      navigatorObservers: [kgNavigatorObserver],
      builder: (context, widget) {
        return NoScaleTextWidget(
          child: widget,
        );
      },
    ),
  );
}

KgNavigatorObserver kgNavigatorObserver = new KgNavigatorObserver();

class KgNavigatorObserver extends NavigatorObserver {
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is MaterialPageRoute) {
      //Jigunag统计页面
      janalytics.onPageStart(route.settings.name);
    }
  }

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is MaterialPageRoute) {
      //Jigunag统计页面
      janalytics.onPageEnd(route.settings.name);
    }
  }
}
