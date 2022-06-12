import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? radius;

  const CustomCard({Key? key, required this.child, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.paddingUltraSmallWidth,
          vertical: context.paddingUltraSmallHeight),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? AppConstants.smallRadius,
          ),
        ),
        child: child,
      ),
    );
  }
}
