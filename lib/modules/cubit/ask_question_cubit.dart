import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gpt/models/chat.dart';
import 'package:gpt/models/text_completion.dart';

import '../../repositories/completion_repository.dart';

part 'ask_question_state.dart';

class AskQuestionCubit extends Cubit<AskQuestionState> {
  AskQuestionCubit() : super(AskQuestionInitial(chats: []));

  final _repo = CompletionRepository();

  Future<void> askQuestion({required String question}) async {
    int version = state.incrementVersion();
    final response = await _repo.getTextCompletionR(question: question);

    List<Chat> currentList = state.props[1] as List<Chat>;

    if (response.statusCode == 200) {
      final answer = response.data as TextCompletion;
      final currentChat = Chat(question: question, answer: answer);

      currentList.add(currentChat);
      emit(AskQuestionSuccess(version: version, chats: currentList));
    } else {
      emit(AskQuestionFailed(
          version: state.props[0] as int, chat: currentList, error: ''));
    }
  }
}
