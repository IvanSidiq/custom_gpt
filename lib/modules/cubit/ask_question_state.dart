part of 'ask_question_cubit.dart';

abstract class AskQuestionState extends Equatable {
  final dynamic propss;
  const AskQuestionState({this.propss});

  @override
  List<Object> get props => [...propss];

  int incrementVersion() {
    int currentVersion = propss[0];
    currentVersion++;
    return currentVersion;
  }
}

class AskQuestionInitial extends AskQuestionState {
  final int version;
  final List<Chat> chats;

  AskQuestionInitial({this.version = 0, required this.chats})
      : super(propss: [version, chats]);
}

class AskQuestionSuccess extends AskQuestionState {
  final int version;
  final List<Chat> chats;

  AskQuestionSuccess({required this.version, required this.chats})
      : super(propss: [version, chats]);
}