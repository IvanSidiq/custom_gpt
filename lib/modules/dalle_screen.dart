import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/customs/custom_color.dart';
import '../utils/customs/custom_text_style.dart';
import 'cubit/dalle_cubit.dart';

class DallEScreen extends StatelessWidget {
  const DallEScreen({Key? key, required this.model}) : super(key: key);
  final String model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DallECubit(),
      child: _DallEScreen(model: model),
    );
  }
}

class _DallEScreen extends StatelessWidget {
  const _DallEScreen({Key? key, required this.model}) : super(key: key);
  final String model;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DallECubit>();
    final textEditingController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: VStack([
          BlocBuilder<DallECubit, DallEState>(
            builder: (context, state) {
              if (state is DallESuccess) {
                print(state.dalle.data!.first.url);
                return CachedNetworkImage(
                  imageUrl: state.dalle.data!.first.url,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Icon(
                            Boxicons.bx_image,
                            size: 24,
                            color: CustomColor.onSurfaceVariant,
                          ))
                      .box
                      .withRounded(value: 16)
                      .border(color: CustomColor.surface4)
                      .color(CustomColor.surface1)
                      .make()
                      .w(context.screenWidth),
                  errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.contain,
                    ),
                  )
                      .box
                      .withRounded(value: 16)
                      .border(color: CustomColor.surface4)
                      .color(CustomColor.surface1)
                      .make()
                      .w(context.screenWidth),
                  imageBuilder: (context, imgProvider) {
                    return Container(
                      width: context.screenWidth,
                      decoration: BoxDecoration(
                        color: CustomColor.surface1,
                        border: Border.all(color: CustomColor.surface4),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: imgProvider, fit: BoxFit.contain),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ).expand(),
          TextField(
            controller: textEditingController,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (value) {
              cubit.imageRequest(prompt: value, model: model, count: 1);
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: CustomColor.surface5)),
                hintText: 'Image prompt',
                hintStyle: CustomTextStyle.titleMedium
                    .copyWith(color: CustomColor.primary)),
          )
              .box
              .color(CustomColor.onPrimary)
              .withRounded(value: 50)
              .makeCentered()
              .py12()
              .h(80)
              .w(context.screenWidth)
        ]),
      ),
    );
  }
}
