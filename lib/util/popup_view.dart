/*
 * @author admin.
 * @date: 2021/7/7 4:21 下午
 * @description: flutter
 */

import 'dart:ui';
import 'package:flutter/material.dart';

///item数据模型
class PopModel {
  final String name;
  final IconData? icon;
  final int? id;

  PopModel({
    required this.name,
    this.icon,
    this.id,
  });

  PopModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        icon = json['icon'],
        id = json['id'];

  Map<String, dynamic> toJson() => {'name': name, 'icon': icon, 'id': id};
}

///弹窗view
class PopupView extends StatefulWidget {
  ///弹窗view位置上方所在widget的标识
  final GlobalKey originKey;

  ///item数据源
  final List<PopModel> itemsData;

  ///item点击选中时回调
  final Function(int, PopModel)? clickCallback;

  ///不展示小三角
  final bool? noTriangle;

  ///弹窗背景色
  final Color? bgColor;

  ///默认选中的item标题
  final String? selText;

  ///item字体颜色
  final Color? itemTitleColor;

  ///item图标颜色
  final Color? itemIconColor;

  ///item选中时字体颜色
  final Color? itemSelectedColor;

  ///item高度 默认50
  final double? itemHeight;

  ///item宽度 默认120
  final double? itemWidth;

  ///item间隔线颜色
  final Color? dividerColor;

  ///小三角高度默认10
  final double? triangleHeight;

  ///小三角宽度默认14
  final double? triangleWidth;

  ///列表弹窗最大高度，若设置最大高度则可滑动 否则高度自适应
  final double? maxHeight;

  const PopupView({
    Key? key,
    required this.originKey,
    required this.itemsData,
    this.bgColor,
    this.itemTitleColor,
    this.itemIconColor,
    this.selText = '',
    this.itemHeight,
    this.itemWidth,
    this.clickCallback,
    this.dividerColor,
    this.itemSelectedColor,
    this.triangleHeight,
    this.triangleWidth,
    this.noTriangle,
    this.maxHeight,
  }) : super(key: key);

  @override
  _PopupViewState createState() => _PopupViewState();
}

class _PopupViewState extends State<PopupView> {
  String? _selText;

  @override
  void initState() {
    super.initState();
    _selText = widget.selText;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(onTap: () => Navigator.pop(context)),
          _buildMenusView(widget.itemsData),
        ],
      ),
    );
  }

  ///弹出框view
  _buildMenusView(List<PopModel> itemsData) {
    RenderBox box =
        widget.originKey.currentContext!.findRenderObject()! as RenderBox;
    double topEdge = box.localToGlobal(Offset.zero).dy + box.size.height;
    double rightEdge = MediaQueryData.fromWindow(window).size.width -
        box.localToGlobal(Offset.zero).dx -
        box.size.width;
    return Positioned(
      right: rightEdge,
      top: topEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          widget.noTriangle == true
              ? SizedBox.shrink()
              : Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TriangleUpWidget(
                    height: widget.triangleHeight ?? 10,
                    width: widget.triangleWidth ?? 14,
                    color: widget.bgColor ?? Colors.black54,
                  ),
                ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              constraints: widget.maxHeight == null
                  ? null
                  : BoxConstraints(
                      maxHeight: widget.maxHeight!,
                    ),
              color: widget.bgColor ?? Colors.black54,
              width: widget.itemWidth ?? 120,
              child: _buildMenuLineCell(itemsData),
            ),
          ),
        ],
      ),
    );
  }

  ///item列表
  Widget _buildMenuLineCell(List<PopModel> itemsData) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemsData.length,
      padding: EdgeInsets.zero,
      physics: widget.maxHeight == null
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: widget.itemHeight ?? 50,
          width: widget.itemWidth ?? 120,
          child: TextButton.icon(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _selText = itemsData[index].name;
              });
              widget.clickCallback?.call(index, itemsData[index]);
            },
            icon: itemsData[index].icon == null
                ? SizedBox.shrink()
                : Icon(
                    itemsData[index].icon!,
                    color: widget.itemIconColor ?? Colors.white,
                  ),
            label: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Text(
                  itemsData[index].name,
                  style: TextStyle(
                    fontSize: 16,
                    color: _selText == itemsData[index].name
                        ? (widget.itemSelectedColor ?? Colors.blue)
                        : (widget.itemTitleColor ?? Colors.white),
                  ),
                ),
                Spacer(),
                Container(
                  height: 1,
                  width: (widget.itemWidth ?? 120) - 50,
                  color: widget.dividerColor ?? Colors.white10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

///绘制小三角
class TriangleUpPainter extends CustomPainter {
  late Color color; //填充颜色
  late Paint _paint; //画笔
  late Path _path; //绘制路径
  // late double angle; //角度

  TriangleUpPainter(Color color) {
    _paint = Paint()
      ..strokeWidth = 1.0 //线宽
      ..color = color
      ..isAntiAlias = true;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final baseX = size.width;
    final baseY = size.height;
    //起点
    _path.moveTo(baseX * 0.5, 0);
    _path.lineTo(baseX, baseY);
    _path.lineTo(0, baseY);
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

///列表上方小三角
class TriangleUpWidget extends StatefulWidget {
  final double height;
  final double width;
  final Color color;

  TriangleUpWidget(
      {Key? key, this.height = 14, this.width = 16, required this.color})
      : super(key: key);

  @override
  CoreTriangleState createState() => CoreTriangleState();
}

class CoreTriangleState extends State<TriangleUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: CustomPaint(
        painter: TriangleUpPainter(widget.color),
      ),
    );
  }
}
