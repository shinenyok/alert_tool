/*
 * @author admin.
 * @date: 2021/6/24 9:52 上午
 * @description: flutter
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetView extends StatefulWidget {
  ///标题文字描述
  final String title;

  ///选项列表
  final List<String> options;

  ///标题文字样式
  final TextStyle titleTextStyle;

  ///选项内容文字样式
  final TextStyle optionTextStyle;

  ///取消按钮文字样式
  final TextStyle cancelTextStyle;

  ///确定选中选项
  final Function(String option) didOptionSelected;

  final Function(int index) didIndexSelected;

  final bool iosStyle;

  const BottomSheetView({
    Key key,
    @required this.title,
    @required this.options,
    @required this.didOptionSelected,
    this.titleTextStyle,
    this.optionTextStyle,
    this.cancelTextStyle,
    this.iosStyle = false,
    this.didIndexSelected,
  }) : super(key: key);

  @override
  _BottomSheetViewState createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: widget.iosStyle
          ? CupertinoActionSheet(
              title: Text(
                widget.title,
                style: widget.titleTextStyle ??
                    TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              actions: widget.options
                  .map(
                    (e) => CupertinoActionSheetAction(
                      onPressed: () {
                        widget.didOptionSelected.call(e);
                      },
                      child: Text(
                        e,
                        style: widget.optionTextStyle,
                      ),
                    ),
                  )
                  .toList(),
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '取消',
                  style: widget.cancelTextStyle,
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('取消'),
                      ),
                      Text(widget.title),
                      TextButton(
                        onPressed: () {
                          if (widget.didIndexSelected != null) {
                            widget.didIndexSelected(selectedIndex);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text('确定'),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Expanded(
                  child: ListWheelScrollView(
                    onSelectedItemChanged: (index) {
                      selectedIndex = index;
                    },
                    squeeze: 1,
                    useMagnifier: true,
                    magnification: 1.5,
                    itemExtent: 40,
                    children: widget.options
                        .map(
                          (e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(e),
                              Divider(
                                height: 1,
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
    );
  }
}
