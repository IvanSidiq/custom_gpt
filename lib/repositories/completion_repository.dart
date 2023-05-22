import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gpt/utils/api.dart';

import '../helper/base_repository.dart';
import '../models/base_response.dart';

class CompletionRepository extends BaseRepository {
  Stream<BaseResponse> getTextCompletionR(
      {required String question, required String model}) async* {
    String postModel = '';

    switch (model.toLowerCase()) {
      case 'ada':
        postModel = 'text-ada-001';
        break;
      case 'babbage':
        postModel = 'text-babbage-001';
        break;
      case 'curie':
        postModel = 'text-curie-001';
        break;
      case 'davinci':
        postModel = 'text-davinci-003';
        break;
      default:
    }

    final response = await post(kApiTextCompletion, data: {
      'model': postModel,
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
