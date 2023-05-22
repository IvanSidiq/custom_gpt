import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gpt/models/chat.dart';

import '../../helper/sse_transformer.dart';
import '../../models/chat_completion.dart';
import '../../repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial(chats: []));

  final _repo = ChatRepository();

  String answer = '';

  Future<void> chatQuestion(
      {required String question, required String model}) async {
    // emit(ChatLoading());
    int version = state.incrementVersion();

    List<Chat> currentList = state.props[1] as List<Chat>;

    answer = '';

    _repo.getTextChatR(question: question, model: model).listen((response) {
      final data = response.data as ResponseBody;

      data.stream
          .transform(unit8Transformer)
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .transform(const SseTransformer())
          .listen((event) {
        if (event.data != '' || event.data != '[DONE]') {
          final ChatCompletion data =
              ChatCompletion.fromJson(json.decode(event.data));

          if (data.choices != null) {
            answer = answer + (data.choices!.first.delta!.content);
          }

          final newChat = Chat(question: question, answer: answer);
          emit(ChatStream(
              version: version, chats: currentList, newChat: newChat));
        }
      }).onDone(() {
        final currentChat = Chat(question: question, answer: answer);

        currentList.add(currentChat);
        emit(ChatSuccess(version: version, chats: currentList));
      });
    });
  }
}
