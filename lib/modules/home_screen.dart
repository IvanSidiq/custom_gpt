import 'package:flutter/material.dart';
import 'package:gpt/utils/customs/custom_color.dart';
import 'package:gpt/utils/customs/custom_text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final a = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: VStack([
          ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return VStack([
                  (index.isEven ? 'question' : 'answer')
                      .text
                      .textStyle(CustomTextStyle.labelSmall)
                      .color(CustomColor.onSurface.withOpacity(0.6))
                      .make(),
                  'text'
                      .text
                      .textStyle(CustomTextStyle.bodyMedium)
                      .make()
                      .pSymmetric(h: 8),
                ])
                    .pSymmetric(h: 24)
                    .box
                    .p16
                    .color(index.isEven
                        ? CustomColor.surface3
                        : CustomColor.background)
                    .width(context.screenWidth)
                    .make();
              }).expand(),
          TextField(
            controller: a,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {},
            onTap: () {},
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Send a message',
                labelStyle: CustomTextStyle.titleMedium
                    .copyWith(color: CustomColor.primary)),
          )
              .pSymmetric(h: 24)
              .box
              .color(CustomColor.onPrimary)
              .withRounded(value: 50)
              .makeCentered()
              .p12()
              .h(80)
              .w(context.screenWidth)
              .color(CustomColor.surface5),
        ]),
      ),
    );
  }
}
