import 'package:gpt/utils/api.dart';

import '../helper/base_repository.dart';
import '../models/base_response.dart';

class ChatRepository extends BaseRepository {
  Stream<BaseResponse> getTextChatR(
      {required String question, required String model}) async* {
    String modelC = 'gpt-3.5-turbo';
    switch (model) {
      case 'GPT 4':
        modelC = 'gpt-4';
        break;
      case 'GPT 3.5':
        modelC = 'gpt-3.5-turbo';
        break;
      default:
    }
    final response = await post(kApiTextChat, data: {
      'model': modelC,
      'messages': [
        {'role': 'user', 'content': question}
      ],
      'max_tokens': 1000, //max text output
      'temperature': 0.7, // 0-2, 0 more focused, 2 more random
      'n': 1, //max completion text
      'stream': true, //type of return
    });

    if (response.data != null) {
      yield BaseResponse(
        data: response.data,
        statusCode: response.statusCode,
      );
    }
  }
}
