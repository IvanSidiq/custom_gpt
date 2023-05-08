part of 'expand_cubit.dart';

@immutable
abstract class ExpandState {}

class ExpandInitial extends ExpandState {}

class ExpandCubitInitialized extends ExpandState {}

class ChangeExpandSuccess extends ExpandState {}
