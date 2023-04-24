import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../services/di_service.dart';

class MainRepository {
  MainRepository() {
    _init();
  }

  _init() async {
    await setConfig();
    GetIt.I<GoRouter>()
        .routerDelegate
        .navigatorKey
        .currentState!
        .context
        .goNamed('home');
  }

  Future<void> setConfig() async {
    OpenAI openAI = await _setupOpenAI();
    DIService.initializeConfig(openAI);
  }

  Future<OpenAI> _setupOpenAI() async {
    final openAI = OpenAI.instance.build(
        token: "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",
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        isLog: true);

    return openAI;
  }
}
