import 'package:gpt/utils/api.dart';

import '../helper/base_repository.dart';
import '../models/base_response.dart';

class CompletionRepository extends BaseRepository {
  Stream<BaseResponse> getTextCompletionR({required String question}) async* {
    final response = await post(kApiTextCompletion, data: {
      'model': 'text-davinci-003',
      'prompt': question,
      'max_tokens': 1000, //max text output
      'temperature': 0.7, // 0-2, 0 more focused, 2 more random
      'n': 1, //max completion text
      'stream': true, //type of return
      'logprobs': null, //will take token if more than 1
    });

    if (response.data != null) {
      yield BaseResponse(
        data: response.data,
        statusCode: response.statusCode,
      );
    }
  }
}
