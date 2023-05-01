import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt/modules/widgets/custom_loading_widget.dart';

import '../repositories/main_repository.dart';
import '../utils/customs/custom_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) => MainRepository(),
      child: const _SplashBody(),
    );
  }
}

class _SplashBody extends StatefulWidget {
  const _SplashBody({Key? key}) : super(key: key);

  @override
  __SplashBodyState createState() => __SplashBodyState();
}

class __SplashBodyState extends State<_SplashBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: const Center(
        // child: Image.asset('assets/icons/icon.png', height: 48.w),
        child: CustomLoadingWidget(),
      ),
    );
  }
}
