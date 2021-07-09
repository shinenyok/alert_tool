# alert_tool

A flutter plugin imitates iOS style pop-up window，Provide a variety of highly customized pop-up styles, such as text pop-up, input pop-up, bottom list pop-up, specific location pop-up, etc

## Getting Started

### 1 Add alert_tool latest version under dependencies to your package's pubspec.yaml file.

```yaml
dependencies:
  alert_tool: ^0.0.2
```

### 2 You can install packages from the command line:
```bash
$ flutter packages get
```

### 3 Api Usage


#### 中间弹出的提示弹窗
* Usage
```
  showTipAlert({
    required BuildContext context,

    ///标题
    String? title,

    ///内容
    required String content,

    ///取消按钮描述文字
    String? cancelText,

    ///确定按钮描述文字
    String? confirmText,

    ///取消动作
    Function? cancelAction,

    ///确定动作
    required Function confirmAction,

    ///标题文字样式
    TextStyle? titleTextStyle,

    ///取消按钮文字样式
    TextStyle? cancelTextStyle,

    ///确定按钮文字样式
    TextStyle? confirmTextStyle,

    ///弹窗内容文字样式
    TextStyle? contentTextStyle,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertView(
          title: title,
          content: content,
          cancelText: cancelText,
          confirmText: confirmText,
          cancelAction: cancelAction,
          confirmAction: confirmAction,
          titleTextStyle: titleTextStyle,
          cancelTextStyle: cancelTextStyle,
          confirmTextStyle: confirmTextStyle,
          contentTextStyle: contentTextStyle,
        );
      },
    );
  }
```
* Example
```
  AlertTool.showTipAlert(
    context: context,
    title: '陈老师发送给你作业笔记',
    content: '是否接收',
    confirmAction: () async {
      print('888q99w88q8w8w98--确定-}')
      Navigator.pop(context);
    },
  );
```
* 预览

![image](https://shineyoki.oss-cn-beijing.aliyuncs.com/confirm_alert.gif)
#### 底部弹出的选择提示弹窗
* Usage
```
  showBottomSheet({
    required BuildContext context,

    ///弹窗标题
    required String title,

    ///弹窗选项列表
    required List<String> options,

    ///弹窗标题文字样式
    TextStyle? titleTextStyle,

    ///弹窗选项文字样式
    TextStyle? optionTextStyle,

    ///弹窗取消文字样式
    TextStyle? cancelTextStyle,

    ///弹窗选项选中返回选项内容
    required Function(String option) didOptionSelected,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return BottomSheetView(
          title: title,
          options: options,
          titleTextStyle: titleTextStyle,
          optionTextStyle: optionTextStyle,
          cancelTextStyle: cancelTextStyle,
          didOptionSelected: didOptionSelected,
        );
      },
    );
  }
```
* Example
```
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
```
* 预览

![image](https://shineyoki.oss-cn-beijing.aliyuncs.com/bottomSheet.gif)
#### 输入弹窗
* Usage
```
  showInputAlert({
    required BuildContext context,

    ///输入弹窗标题
    required String title,
    //输入弹窗确定按钮返回输入内容
    required Function(String text) confirmAction,

    ///输入框可输入最大行数
    int? maxLines,

    ///输入框可输入文字最大数
    int? maxLength,

    ///输入框占位符
    String? placeholder,

    ///取消按钮文字描述
    String? cancelText,

    ///确定按钮文字描述
    String? confirmText,

    ///取消按钮动作
    Function? cancelAction,

    ///标题文字样式
    TextStyle? titleTextStyle,

    ///输入框占位符文字样式
    TextStyle? placeholderStyle,

    ///确定按钮文字描述
    TextStyle? confirmTextStyle,

    ///取消按钮文字描述
    TextStyle? cancelTextStyle,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return InputView(
          title: title,
          maxLines: maxLines,
          maxLength: maxLength,
          placeholder: placeholder,
          confirmAction: confirmAction,
          titleTextStyle: titleTextStyle,
          placeholderStyle: placeholderStyle,
          cancelText: cancelText,
          confirmText: confirmText,
          cancelAction: cancelAction,
          confirmTextStyle: confirmTextStyle,
          cancelTextStyle: cancelTextStyle,
        );
      },
    );
  }
```
* Example 
```
   AlertTool.showInputAlert(
      context: context,
      title: '提取码',
      placeholder: '请输入提取码',
      confirmAction: (code) {
        print('09xi20yi90wu12yu98zi23---$code');
        Navigator.pop(context);
      },
    );
```
* 预览

![image](https://shineyoki.oss-cn-beijing.aliyuncs.com/input_alert.gif)
#### 按钮正下方弹窗
* Usage
```
showPopMenu(
    BuildContext context, {

    ///弹窗view位置上方所在widget的标识
    required GlobalKey originKey,

    ///item数据源
    required List<PopModel> itemsData,

    ///item点击选中时回调
    Function(int, PopModel)? clickCallback,

    ///不展示小三角 默认展示
    bool? noTriangle,

    ///弹窗背景色
    Color? backgroundColor,

    ///默认选中的item标题
    String? selectedText,

    ///item字体颜色
    Color? itemTitleColor,

    ///item图标颜色
    Color? itemIconColor,

    ///item选中时字体颜色
    Color? itemSelectedColor,

    ///item高度 默认50
    double? itemHeight,

    ///item宽度 默认120
    double? itemWidth,

    ///item间隔线颜色
    Color? dividerColor,

    ///小三角高度默认10
    double? triangleHeight,

    ///小三角宽度 默认14
    double? triangleWidth,
  }) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (context) {
        return PopupView(
          originKey: originKey,
          itemsData: itemsData,
          clickCallback: clickCallback,
          noTriangle: noTriangle,
          selText: selectedText,
          bgColor: backgroundColor,
          itemHeight: itemHeight,
          itemWidth: itemWidth,
          itemIconColor: itemIconColor,
          itemSelectedColor: itemSelectedColor,
          itemTitleColor: itemTitleColor,
          triangleWidth: triangleWidth,
          triangleHeight: triangleHeight,
          dividerColor: dividerColor,
        );
      },
    );
  }
```
* Example
```
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
```
* 预览

![image](https://shineyoki.oss-cn-beijing.aliyuncs.com/position_alert.gif)