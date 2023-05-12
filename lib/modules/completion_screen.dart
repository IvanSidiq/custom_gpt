import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gpt/models/chat.dart';
import 'package:gpt/modules/cubit/ask_question_cubit.dart';
import 'package:gpt/utils/customs/custom_color.dart';
import 'package:gpt/utils/customs/custom_text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AskQuestionCubit(),
      child: const _CompletionScreen(),
    );
  }
}

class _CompletionScreen extends HookWidget {
  const _CompletionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AskQuestionCubit>();

    final a = TextEditingController();
    final scrollController = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: VStack([
          VStack([
            BlocConsumer<AskQuestionCubit, AskQuestionState>(
              listener: (context, state) {
                if (state is AskQuestionSuccess) {
                  a.text = '';
                }
                if (state is AskQuestionStream) {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                }
              },
              builder: (context, state) {
                final chats = state.propss[1] as List<Chat>;
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return VStack([
                        VStack([
                          'instruction'
                              .text
                              .textStyle(CustomTextStyle.labelSmall)
                              .color(CustomColor.onSurface.withOpacity(0.6))
                              .make(),
                          chats[index]
                              .question
                              .text
                              .textStyle(CustomTextStyle.bodyMedium)
                              .make()
                              .pSymmetric(h: 8),
                        ])
                            .pSymmetric(h: 24)
                            .box
                            .p16
                            .color(CustomColor.surface3)
                            .width(context.screenWidth)
                            .make(),
                        VStack([
                          'answer'
                              .text
                              .textStyle(CustomTextStyle.labelSmall)
                              .color(CustomColor.onSurface.withOpacity(0.6))
                              .make(),
                          chats[index]
                              .answer
                              .text
                              .textStyle(CustomTextStyle.bodyMedium)
                              .make()
                              .pSymmetric(h: 8),
                        ])
                            .pSymmetric(h: 24)
                            .box
                            .p16
                            .color(CustomColor.background)
                            .width(context.screenWidth)
                            .make()
                      ]);
                    });
              },
            ),
            BlocBuilder<AskQuestionCubit, AskQuestionState>(
                builder: (context, state) {
              if (state is AskQuestionStream) {
                return VStack([
                  VStack([
                    'instruction'
                        .text
                        .textStyle(CustomTextStyle.labelSmall)
                        .color(CustomColor.onSurface.withOpacity(0.6))
                        .make(),
                    state.newChat.question.text
                        .textStyle(CustomTextStyle.bodyMedium)
                        .make()
                        .pSymmetric(h: 8),
                  ])
                      .pSymmetric(h: 24)
                      .box
                      .p16
                      .color(CustomColor.surface3)
                      .width(context.screenWidth)
                      .make(),
                  VStack([
                    'answer'
                        .text
                        .textStyle(CustomTextStyle.labelSmall)
                        .color(CustomColor.onSurface.withOpacity(0.6))
                        .make(),
                    state.newChat.answer.text
                        .textStyle(CustomTextStyle.bodyMedium)
                        .make()
                        .pSymmetric(h: 8),
                  ])
                      .pSymmetric(h: 24)
                      .box
                      .p16
                      .color(CustomColor.background)
                      .width(context.screenWidth)
                      .make()
                ]);
              }
              return Container();
            }),
          ]).scrollVertical(controller: scrollController).expand(),
          TextField(
            controller: a,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (value) {
              cubit.askQuestion(question: value);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Send a message',
                hintStyle: CustomTextStyle.titleMedium
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
