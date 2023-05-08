import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt/modules/cubit/expand_cubit.dart';
import 'package:gpt/utils/customs/custom_color.dart';
import 'package:gpt/utils/customs/custom_text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpandCubit(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends HookWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instructModel = ['Ada', 'Babbage', 'Curie', 'Davinci'];
    final chatModel = ['GPT 3.5', 'GPT 4'];
    final imageModel = ['256', '512', '1024'];

    final cubit = context.read<ExpandCubit>();

    useEffect(() {
      cubit.initiateExpandableField(4, true);
      return;
    }, [cubit]);

    return Scaffold(
      backgroundColor: CustomColor.surface,
      body: SafeArea(
        child: BlocConsumer<ExpandCubit, ExpandState>(
          listener: (context, state) {},
          builder: (context, state) {
            return VStack(
              [
                48.heightBox,
                'Open AI Powered APP'
                    .text
                    .textStyle(CustomTextStyle.headlineMedium)
                    .make(),
                32.heightBox,
                HStack([
                  'Text Instruct'
                      .text
                      .textStyle(CustomTextStyle.titleMedium)
                      .make(),
                  const SizedBox().expand(),
                  (cubit.expandableField[0]
                      ? const Icon(Boxicons.bx_caret_right_circle)
                      : const Icon(Boxicons.bx_caret_down_circle)),
                ]).color(CustomColor.surface).onTap(() {
                  cubit.changeExpand(
                      index: 0, expand: !cubit.expandableField[0]);
                }),
                16.heightBox,
                cubit.expandableField[0]
                    ? Container()
                    : AlignedGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        crossAxisCount: 2,
                        itemCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemBuilder: (context, index) {
                          return instructModel[index]
                              .text
                              .textStyle(CustomTextStyle.bodyMedium)
                              .color(CustomColor.onPrimary)
                              .makeCentered()
                              .box
                              .height(92)
                              .p16
                              .color(CustomColor.primary)
                              .withRounded(value: 16)
                              .make()
                              .onTap(() {
                            context.pushNamed(instructModel[index]);
                          });
                        },
                      ).h(200).w(context.screenWidth).pOnly(bottom: 16),
                HStack([
                  'Chat'.text.textStyle(CustomTextStyle.titleMedium).make(),
                  const SizedBox().expand(),
                  (cubit.expandableField[1]
                      ? const Icon(Boxicons.bx_caret_right_circle)
                      : const Icon(Boxicons.bx_caret_down_circle)),
                ]).color(CustomColor.surface).onTap(() {
                  cubit.changeExpand(
                      index: 1, expand: !cubit.expandableField[1]);
                }),
                16.heightBox,
                cubit.expandableField[1]
                    ? Container()
                    : AlignedGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        crossAxisCount: 2,
                        itemCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemBuilder: (context, index) {
                          return chatModel[index]
                              .text
                              .textStyle(CustomTextStyle.bodyMedium)
                              .color(CustomColor.onPrimary)
                              .makeCentered()
                              .box
                              .height(92)
                              .p16
                              .color(CustomColor.primary)
                              .withRounded(value: 16)
                              .make()
                              .onTap(() {
                            context.goNamed(chatModel[index]);
                          });
                        },
                      ).h(100).w(context.screenWidth).pOnly(bottom: 16),
                HStack([
                  'Image'.text.textStyle(CustomTextStyle.titleMedium).make(),
                  const SizedBox().expand(),
                  (cubit.expandableField[2]
                      ? const Icon(Boxicons.bx_caret_right_circle)
                      : const Icon(Boxicons.bx_caret_down_circle)),
                ]).color(CustomColor.surface).onTap(() {
                  cubit.changeExpand(
                      index: 2, expand: !cubit.expandableField[2]);
                }),
                16.heightBox,
                cubit.expandableField[2]
                    ? Container()
                    : AlignedGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        crossAxisCount: 3,
                        itemCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemBuilder: (context, index) {
                          return imageModel[index]
                              .text
                              .textStyle(CustomTextStyle.bodyMedium)
                              .color(CustomColor.onPrimary)
                              .makeCentered()
                              .box
                              .height(68)
                              .p16
                              .color(CustomColor.primary)
                              .withRounded(value: 16)
                              .make();
                        },
                      ).h(75).w(context.screenWidth).pOnly(bottom: 16),
                HStack([
                  'Audio'.text.textStyle(CustomTextStyle.titleMedium).make(),
                  const SizedBox().expand(),
                  (cubit.expandableField[3]
                      ? const Icon(Boxicons.bx_caret_right_circle)
                      : const Icon(Boxicons.bx_caret_down_circle)),
                ]).color(CustomColor.surface).onTap(() {
                  cubit.changeExpand(
                      index: 3, expand: !cubit.expandableField[3]);
                }),
                16.heightBox,
                cubit.expandableField[3]
                    ? Container()
                    : HStack([
                        'Whisper'
                            .text
                            .textStyle(CustomTextStyle.bodyMedium)
                            .color(CustomColor.onPrimary)
                            .makeCentered()
                            .pSymmetric(h: 32, v: 16)
                            .box
                            .height(68)
                            .color(CustomColor.primary)
                            .withRounded(value: 16)
                            .make(),
                        const SizedBox().expand()
                      ]),
              ],
              crossAlignment: CrossAxisAlignment.center,
            );
          },
        ).w(context.screenWidth).px16().scrollVertical(),
      ),
    );
  }
}
