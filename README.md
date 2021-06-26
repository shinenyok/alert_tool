# alert_tool

A flutter plugin imitates iOS style pop-up window

## Getting Started

### 1 Add alert_tool latest version under dependencies to your package's pubspec.yaml file.

```yaml
dependencies:
  alert_tool: ^0.0.1
```

### 2 You can install packages from the command line:
```bash
$ flutter packages get
```

### 3 Api Usage


* 中间弹出的提示弹窗
```
  AlertTool.showTipAlert({
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
* 底部弹出的选择提示弹窗
```
  AlertTool.showBottomSheet({
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
* 输入弹窗
```
  AlertTool.showInputAlert({
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

## 预览

![image](https://shineyoki.oss-cn-beijing.aliyuncs.com/alert.gif)
