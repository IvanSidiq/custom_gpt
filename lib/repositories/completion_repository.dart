import 'package:gpt/utils/api.dart';

import '../helper/base_repository.dart';
import '../models/base_response.dart';
import '../models/text_completion.dart';

class CompletionRepository extends BaseRepository {
  Future<BaseResponse> getTextCompletionR({required String question}) async {
    final response = await post(kApiTextCompletion, data: {
      'model': 'text-davinci-003',
      'prompt': question,
      'max_tokens': 100, //max text output
      'temperature': 0.7, // 0-2, 0 more focused, 2 more random
      'n': 1, //max completion text
      'stream': false, //type of return
      'logprobs': null, //will take token if more than 1
      // 'stop': '\n'
    });

    if (response.statusCode == 200) {
      final TextCompletion data = TextCompletion.fromJson(response.data);
      return BaseResponse(
        statusCode: response.statusCode,
        data: data,
      );
    }
    return response;
  }
}
