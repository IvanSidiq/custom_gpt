part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  final dynamic propss;
  const ChatState({this.propss});

  @override
  List<Object> get props => [...propss];

  int incrementVersion() {
    int currentVersion = propss[0];
    currentVersion++;
    return currentVersion;
  }
}

class ChatInitial extends ChatState {
  final int version;
  final List<Chat> chats;

  ChatInitial({this.version = 0, required this.chats})
      : super(propss: [version, chats]);
}

class ChatLoading extends ChatState {
  final ChatState state;

  ChatLoading(this.state) : super(propss: [state.props[0], state.props[1]]);
}

class ChatStream extends ChatState {
  final int version;
  final List<Chat> chats;
  final Chat newChat;

  ChatStream(
      {required this.version, required this.chats, required this.newChat})
      : super(propss: [version, chats, newChat]);
}

class ChatSuccess extends ChatState {
  final int version;
  final List<Chat> chats;

  ChatSuccess({required this.version, required this.chats})
      : super(propss: [version, chats]);
}

class ChatFailed extends ChatState {
  final int version;
  final String error;
  final List<Chat> chat;

  ChatFailed({required this.version, required this.error, required this.chat})
      : super(propss: [version, chat, error]);
}
