import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clipboard_listener/clipboard_listener.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    ClipboardListener.addListener(() async {
      _controller.text = "粘贴板发生改变:${(await Clipboard.getData(Clipboard.kTextPlain)).text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Offstage(
                offstage: !Platform.isAndroid,
                child: Text(
                  "**注意：由于Android10改变了监听器策略，因此，当您的APP在后台运行时，将不会通知您**",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                height: 10,
              ),
              TextField(
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabled: false,
                ),
              ),
              RaisedButton(
                child: Text("立即复制随机值"),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: "${Random().nextDouble()}"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
