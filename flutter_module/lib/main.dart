import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'Pages/FirstPageWidget.dart';
import 'Pages/SecondPageWidget.dart';
import 'Pages/InfoPageWidget.dart';

const EventChannel eventChannel =
    const EventChannel("samples.flutter.io/nativeCallFlutter");
const MethodChannel platform =
    const MethodChannel("samples.flutter.io/flutterCallNative");
const MethodChannel secondPlatform =
    const MethodChannel("samples.flutter.io/secondflutterCallNative");

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    //其中pageName为原生代码传递过来的路由名称（
    //first，second，flutterFragment）都是路由名称 params为原生传递过来的参数
    FlutterBoost.singleton.registerPageBuilders({
      'firstPage': (pageName, params, _) => FirstPageWidget(params),
      'secondPage': (pageName, params, _) => SecondPageWidget(params),
      'infoPage': (pageName, params, _) => InfoPageWidget(params),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container());
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}
}
