import 'package:flutter/material.dart';
import 'package:alert_tool/alert_tool.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                AlertTool.showTipAlert(
                  context: context,
                  title: '陈老师发送给你作业笔记',
                  content: '是否接收',
                  confirmAction: () async {
                    print('888q99w88q8w8w98--确定-}');
                    Navigator.pop(context);
                  },
                );
              },
              child: Text('文字提示弹窗'),
            ),
          ),
          TextButton(
            onPressed: () {
              AlertTool.showInputAlert(
                context: context,
                title: '提取码',
                placeholder: '请输入提取码',
                confirmAction: (code) {
                  print('09xi20yi90wu12yu98zi23---$code');
                  Navigator.pop(context);
                },
              );
            },
            child: Text('输入提示弹窗'),
          ),
          TextButton(
            onPressed: () {
              AlertTool.showBottomSheet(
                  context: context,
                  title: '请选择性别',
                  options: [
                    '男',
                    '女',
                  ],
                  didOptionSelected: (value) {
                    print('7877we787y32yy77823ye7---$value');
                    Navigator.pop(context);
                  });
            },
            child: Text('底部列表弹窗'),
          ),
        ],
      ),
    );
  }
}
