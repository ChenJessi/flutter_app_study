import 'package:flutter/material.dart';


/// 带图标的输入框
class InputWidget extends StatefulWidget{
  // 是否隐藏输入内容
  final bool obscureText;
  // 提示文本
  final String? hintText;
  // 图标
  final IconData? iconData;
  // 输入内容改变回调
  final ValueChanged<String>? onChanged;
  // 文本样式
  final TextStyle? textStyle;
  // 文本控制器
  final TextEditingController? controller;

  InputWidget({Key? key,
    this.hintText,
    this.iconData,
    this.onChanged,
    this.textStyle,
    this.controller,
    this.obscureText = false});

  @override
  State<StatefulWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget>{
  @override
  Widget build(BuildContext context) {
    return new TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: new InputDecoration(
          hintText: widget.hintText,
          icon: widget.iconData == null ? null : new Icon(widget.iconData)
        ),
        magnifierConfiguration: TextMagnifierConfiguration(magnifierBuilder: (
          BuildContext context,
          MagnifierController controller,
          ValueNotifier<MagnifierInfo> magnifierInfo,
        ) {
          return null;
        }));
  }
}