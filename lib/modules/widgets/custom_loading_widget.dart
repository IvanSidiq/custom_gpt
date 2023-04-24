import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/customs/custom_color.dart';
import '../../utils/customs/custom_shadow.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    Key? key,
    this.topPadding = 0,
    this.botPadding = 0,
    this.size = 50,
    this.height = 65,
    this.isLinear = false,
    this.strokeWidth = 4,
    this.color,
  }) : super(key: key);

  final bool isLinear;
  final double topPadding;
  final double botPadding;
  final double size;
  final double height;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: botPadding),
          child: SizedBox(
            height: size,
            width: size,
            child: Center(
              child: isLinear
                  ? const LinearProgressIndicator()
                  : CircularProgressIndicator(
                      color: color,
                      strokeWidth: strokeWidth,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLoadingPaginationWidget extends StatelessWidget {
  const CustomLoadingPaginationWidget({
    Key? key,
    this.topPadding = 0,
    this.botPadding = 0,
    this.size = 24,
    this.height = 65,
    this.isLinear = false,
    this.strokeWidth = 4,
  }) : super(key: key);

  final bool isLinear;
  final double topPadding;
  final double botPadding;
  final double size;
  final double height;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: botPadding),
          child: SizedBox(
            height: size,
            width: size,
            child: Center(
              child: isLinear
                  ? const LinearProgressIndicator()
                  : CircularProgressIndicator(
                      strokeWidth: strokeWidth,
                      color: CustomColor.primary,
                    ),
            ),
          )
              .box
              .p8
              .color(CustomColor.surface)
              .withRounded(value: 100)
              .withShadow([CustomShadow.bellow]).make(),
        ),
      ),
    );
  }
}
