import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../main.dart';

class FirstPageWidget extends StatefulWidget {
  final Map params;
  FirstPageWidget(this.params);

  @override
  _FirstPageWidgetState createState() => _FirstPageWidgetState(params);
}

class _FirstPageWidgetState extends State<FirstPageWidget> {
  final Map params;
  _FirstPageWidgetState(this.params);

  String value = '';

  void _onEvent(Object event) {
    if (event is Map) {
      setState(() {
        value = event["params"].toString();
      });
    }

    print("----------$event----------");
  }

  void _onError(Object error) {
    setState(() {});
  }

  void initState() {
    super.initState();
    eventChannel
        .receiveBroadcastStream()
        .listen(_onEvent, onError: _onError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("我是FirstPage，参数是：$params"),
          RaisedButton(
            child: Text('与原生push一样的页面'),
            onPressed: () {
              //dart通过原生跳转dart页面
              FlutterBoost.singleton.open("firstPage",
                  urlParams: {"key": "我跳了一个页面"},
                  exts: {"animated": true, "title": "firstPage2"});
            },
          ),
          RaisedButton(
            child: Text('Go back!'),
            onPressed: () {
              //关闭dart页面
              FlutterBoost.singleton.closeByContext(context);
            },
          ),
          RaisedButton(
              child: Text('Flutter call Native'), onPressed: _flutterCallNative),
          Text(value.length > 0 ? "收到消息：$value" : '')
        ],
      ),
    );
  }

  Future<Null> _flutterCallNative() async {
    try {
      var result = await platform.invokeMethod("flutterCallNative");
      setState(() {
        value = result.toString();
      });
    } catch (e) {
      print("Failed flutterCallNative: '${e.message}'.");
    }
  }
}
