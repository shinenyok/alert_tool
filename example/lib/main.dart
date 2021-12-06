import 'package:flutter/cupertino.dart';
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
  GlobalKey _rightKey = GlobalKey();
  GlobalKey _key = GlobalKey();
  String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
        actions: [
          Container(
            key: _rightKey,
            child: Column(
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    AlertTool.showPopMenu(
                      context,
                      originKey: _rightKey,
                      itemsData: [
                        PopModel(name: '发起群聊', icon: Icons.message, id: 1),
                        PopModel(name: '添加朋友', icon: Icons.add, id: 2),
                        PopModel(name: '扫一扫', icon: Icons.scanner, id: 3),
                        PopModel(name: '收付款', icon: Icons.money, id: 4),
                      ],
                      clickCallback: (index, model) {
                        print('current-----$index----${model.toString()}');
                      },
                    );
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('导航弹窗'),
                  ),
                  label: Icon(Icons.arrow_drop_down),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
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
                  },
                );
              },
              child: Text('底部列表弹窗'),
            ),
            TextButton(
              onPressed: () {
                AlertTool.showBottomPicker(
                  context: context,
                  title: '选择年级',
                  options: [
                    '一年级',
                    '二年级',
                    '三年级',
                    '四年级',
                    '五年级',
                    '六年级',
                    '七年级',
                    '八年级',
                    '九年级',
                    '十年级',
                    '十一年级',
                    '十二年级',
                  ],
                  didIndexSelected: (index) {
                    print('7877we787y32yy77823ye7---$index');
                    Navigator.pop(context);
                  },
                );
              },
              child: Text('底部选择弹窗'),
            ),
            TextButton.icon(
              key: _key,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan),
              ),
              onPressed: () {
                AlertTool.showPopMenu(context,
                    originKey: _key,
                    selectedText: selectedText,
                    noTriangle: true,
                    maxHeight: 200,
                    itemsData: [
                      PopModel(name: "发起群聊"),
                      PopModel(name: '添加朋友'),
                      PopModel(name: '扫一扫'),
                      PopModel(name: '收付款'),
                      PopModel(name: "发起群聊"),
                      PopModel(name: '添加朋友'),
                      PopModel(name: '扫一扫'),
                      PopModel(name: '收付款'),
                      PopModel(name: "发起群聊"),
                      PopModel(name: '添加朋友'),
                      PopModel(name: '扫一扫'),
                      PopModel(name: '收付款'),
                      PopModel(name: "发起群聊"),
                      PopModel(name: '添加朋友'),
                      PopModel(name: '扫一扫'),
                      PopModel(name: '收付款'),
                      PopModel(name: "发起群聊"),
                      PopModel(name: '添加朋友'),
                      PopModel(name: '扫一扫'),
                      PopModel(name: '收付款'),
                    ], clickCallback: (index, model) {
                  setState(() {
                    selectedText = model.name;
                  });
                });
              },
              label: Icon(Icons.arrow_drop_down),
              icon: Container(
                alignment: Alignment.center,
                width: 60,
                child: Text(selectedText.isNotEmpty ? selectedText : '中间弹窗'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
