import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gpt/models/chat.dart';
import 'package:gpt/models/text_completion.dart';

import '../../helper/sse_transformer.dart';
import '../../repositories/completion_repository.dart';

part 'ask_question_state.dart';

class AskQuestionCubit extends Cubit<AskQuestionState> {
  AskQuestionCubit() : super(AskQuestionInitial(chats: []));

  final _repo = CompletionRepository();

  String answer = '';

  Future<void> askQuestion({required String question}) async {
    int version = state.incrementVersion();

    List<Chat> currentList = state.props[1] as List<Chat>;

    answer = '';

    _repo.getTextCompletionR(question: question).listen((response) {
      final data = response.data as ResponseBody;

      data.stream
          .transform(unit8Transformer)
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .transform(const SseTransformer())
          .listen((event) {
        if (event.data != '' || event.data.trim() != '[DONE]') {
          final TextCompletion data =
              TextCompletion.fromJson(json.decode(event.data));

          if (data.choices != null) {
            answer = answer + (data.choices!.first.text ?? '');
          }

          final newChat = Chat(question: question, answer: answer);
          emit(AskQuestionStream(
              version: version, chats: currentList, newChat: newChat));
        }
      }).onDone(() {
        final currentChat = Chat(question: question, answer: answer);

        currentList.add(currentChat);
        emit(AskQuestionSuccess(version: version, chats: currentList));
      });
    });
  }
}
