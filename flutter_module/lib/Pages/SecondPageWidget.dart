import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../main.dart';

class SecondPageWidget extends StatefulWidget {
  final Map params;
  SecondPageWidget(this.params);

  @override
  _SecondPageWidgetState createState() => _SecondPageWidgetState(params);
}

class _SecondPageWidgetState extends State<SecondPageWidget> {
  final Map params;
  _SecondPageWidgetState(this.params);

  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("secondPage"),
        ),
        body: Column(
          children: <Widget>[
            Text("参数是：$params"),
            RaisedButton(
              onPressed: () {
                // 关闭dart页面
                FlutterBoost.singleton.closeByContext(context);
              },
              child: Text('Go back!'),
            ),
            RaisedButton(
              onPressed: () {
                FlutterBoost.singleton.closeByContext(context);
                //dart跳转原生页面以及传递参数
                FlutterBoost.singleton.open("firstPage",
                    urlParams: {"key": "我跳了一个页面"},
                    exts: {"animated": true, "title": "标题"});
              },
              child: Text('跳转firstPage传递参数'),
            ),
            RaisedButton(
              child: Text('Flutter call Native'), onPressed: _secondflutterCallNative),
          Text(value.length > 0 ? "收到消息：$value" : '')
          ],
        ));
  }

  Future<Null> _secondflutterCallNative() async {
    try {
      var result = await secondPlatform.invokeMethod("secondflutterCallNative");
      setState(() {
        value = result.toString();
      });
    } catch (e) {
      print("Failed flutterCallNative: '${e.message}'.");
    }
  }
}
