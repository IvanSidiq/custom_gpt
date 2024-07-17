import 'package:gpt/models/dalle.dart';

import '../helper/base_repository.dart';
import '../models/base_response.dart';
import '../utils/api.dart';

class DallERepository extends BaseRepository {
  Future<BaseResponse> getDallER(
      {required String prompt,
      required String model,
      required int count}) async {
    String postModel = '';

    switch (model.toLowerCase()) {
      case '256':
        postModel = '256x256';
        break;
      case '512':
        postModel = '512x512';
        break;
      case '1024':
        postModel = '1024x1024';
        break;
      default:
    }

    final response = await post(kApiDallE, data: {
      'prompt': prompt,
      'n': count,
      'size': postModel,
    });

    if (response.statusCode == 200) {
      final DallE data = DallE.fromJson(response.data);

      return BaseResponse(
        statusCode: response.statusCode,
        data: data,
      );
    }

    return response;
  }
}
