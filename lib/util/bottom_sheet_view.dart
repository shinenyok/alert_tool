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

  final bool isSheetStyle;

  const BottomSheetView({
    Key key,
    @required this.title,
    @required this.options,
    @required this.didOptionSelected,
    this.titleTextStyle,
    this.optionTextStyle,
    this.cancelTextStyle,
    this.isSheetStyle = false,
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
      height: 300,
      color: Colors.white,
      child: widget.isSheetStyle ?? false
          ? CupertinoActionSheet(
              title: Text(
                widget.title,
                style: widget.titleTextStyle ??
                    TextStyle(
                      color: Color(0xFF3F454F),
                      fontSize: 17,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '取消',
                          style: TextStyle(
                            color: Color(0xFF646B77),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          widget.title,
                          style: widget.titleTextStyle ??
                              TextStyle(
                                color: Color(0xFF3F454F),
                                fontSize: 17,
                              ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (widget.didIndexSelected != null) {
                            widget.didIndexSelected(selectedIndex);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '确定',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3581FF),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Expanded(
                  child: CupertinoPicker(
                    onSelectedItemChanged: (index) {
                      selectedIndex = index;
                    },
                    squeeze: 1,
                    useMagnifier: true,
                    magnification: 1.4,
                    itemExtent: 40,
                    children: widget.options
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17),
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                            ),
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
