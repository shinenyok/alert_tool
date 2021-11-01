/*
 * @author admin.
 * @date: 2021/6/23 4:41 下午
 * @description: flutter
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {
  ///标题
  final String title;

  ///内容
  final String content;

  ///标题样式
  final TextStyle titleTextStyle;

  ///内容样式
  final TextStyle contentTextStyle;

  ///确定样式
  final TextStyle confirmTextStyle;

  ///取消样式
  final TextStyle cancelTextStyle;

  ///确定文字描述
  final String confirmText;

  ///确定回调
  final Function confirmAction;

  ///取消文字描述
  final String cancelText;

  ///取消回调
  final Function cancelAction;

  const AlertView({
    Key key,
    @required this.confirmAction,
    this.cancelAction,
    this.title,
    @required this.content,
    this.titleTextStyle,
    this.contentTextStyle,
    this.confirmTextStyle,
    this.cancelTextStyle,
    this.confirmText,
    this.cancelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: CupertinoAlertDialog(
        title: Column(
          children: [
            Text(
              title ?? "提示",
              style: titleTextStyle ??
                  TextStyle(
                    color: Color(0xFF3F454F),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
        content: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 78,
              child: SingleChildScrollView(
                child: Container(
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF3F454F),
                      fontSize: 15,
                      height: 1.8,
                    ),
                    maxLines: null,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text(
              cancelText ?? "取消",
              style: cancelTextStyle??TextStyle(
                color: Color(0xFF666666),
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              cancelAction?.call();
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(
              confirmText ?? "确定",
              style: confirmTextStyle??TextStyle(
                color: Color(0xFF3581FF),
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              confirmAction.call();
            },
          ),
        ],
      ),
    );
  }
}
