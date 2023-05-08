import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'expand_state.dart';

class ExpandCubit extends Cubit<ExpandState> {
  ExpandCubit() : super(ExpandInitial());
  List<bool> expandableField = [];

  void initiateExpandableField(int fieldCount, bool initiateBool) {
    for (var i = 0; i < fieldCount; i++) {
      expandableField.add(initiateBool);
    }
    emit(ExpandCubitInitialized());
  }

  void changeExpand({required int index, required bool expand}) {
    expandableField[index] = expand;
    emit(ChangeExpandSuccess());
  }
}
