import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? radius;

  const RoundedContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius ?? 10.0)
      ),
      child: child,
    );
  }
}
