import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gpt/models/chat.dart';

part 'ask_question_state.dart';

class AskQuestionCubit extends Cubit<AskQuestionState> {
  AskQuestionCubit() : super(AskQuestionInitial(chats: []));

  Future<void> askQuestion({required String question}) async {
    int version = state.incrementVersion();
    final list = Chat(question: question, answer: '$question : answer');
    List<Chat> currentList = state.props[1] as List<Chat>;

    currentList.add(list);

    emit(AskQuestionSuccess(version: version, chats: currentList));
  }
}
