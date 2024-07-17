import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gpt/models/dalle.dart';

import '../../repositories/dalle_repository.dart';

part 'dalle_state.dart';

class DallECubit extends Cubit<DallEState> {
  DallECubit() : super(DallEInitial(dalle: DallE()));

  final _repo = DallERepository();

  String answer = '';

  Future<void> imageRequest(
      {required String prompt,
      required String model,
      required int count}) async {
    emit(DallELoading(state));
    int version = state.incrementVersion();
    final response =
        await _repo.getDallER(prompt: prompt, model: model, count: count);

    if (response.statusCode == 200) {
      emit(DallESuccess(version: version, dalle: response.data));
    } else {
      emit(DallEFailed(version: version, error: response.message));
    }
  }
}
