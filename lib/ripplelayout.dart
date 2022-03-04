import 'package:flutter/material.dart';

@immutable
class MRippleLayout extends StatelessWidget {
  final double? radius;
  final double? width;
  final double? height;
  final Color? btnColor;
  final Color? touchColor;
  final Color? rippleColor;
  final GestureTapCallback? tapCallback;
  final Widget child;
  const MRippleLayout({
    Key? key,
    this.radius,
    this.width,
    this.height,
    this.btnColor,
    this.touchColor,
    this.rippleColor,
    this.tapCallback,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      //控件背景区域圆角以及水波纹扩散填充的圆角
      borderRadius: radius == null ? null : BorderRadius.circular(radius!),
      child: Ink(
        decoration: BoxDecoration(
          color: btnColor,
        ),
        child: InkWell(
          //点击|触摸的时候,高亮显示的颜色
          highlightColor: touchColor != Colors.green
              ? touchColor
              : Theme.of(context).highlightColor,
          //波纹扩散颜色
          splashColor: rippleColor != Colors.pink
              ? rippleColor
              : Theme.of(context).splashColor,
          onTap: tapCallback,
          child: Container(
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}