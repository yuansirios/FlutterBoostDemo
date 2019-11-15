import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class InfoPageWidget extends StatefulWidget {

  //原生传递过来的参数
  final Map params;
  InfoPageWidget(this.params);

  @override
  _InfoPageWidgetState createState() => _InfoPageWidgetState(params);
}

class _InfoPageWidgetState extends State<InfoPageWidget> {

  final Map params;
  _InfoPageWidgetState(this.params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('参数展示'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 32.0),
            child: Text(
              params["key"] ?? '',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
            alignment: AlignmentDirectional.center,
          ),
          RaisedButton(
            onPressed: () {
              //dart跳转原生页面以及传递参数
              BoostContainerSettings settings =
                BoostContainer.of(context).settings;
              FlutterBoost.singleton.close(settings.uniqueId,
                result: {"result": "data from infoPage"});
            },
            child: Text('跳转原生页面以及传递参数'),
          ),
        ],
      ),
    );
  }
}