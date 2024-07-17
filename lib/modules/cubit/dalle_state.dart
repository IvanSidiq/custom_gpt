part of 'dalle_cubit.dart';

abstract class DallEState extends Equatable {
  final dynamic propss;
  const DallEState({this.propss});

  @override
  List<Object> get props => [...propss];

  int incrementVersion() {
    int currentVersion = propss[0];
    currentVersion++;
    return currentVersion;
  }
}

class DallEInitial extends DallEState {
  final int version;
  final DallE dalle;

  DallEInitial({this.version = 0, required this.dalle})
      : super(propss: [version, dalle]);
}

class DallELoading extends DallEState {
  final DallEState state;

  DallELoading(this.state) : super(propss: [state.props[0], state.props[1]]);
}

class DallESuccess extends DallEState {
  final int version;
  final DallE dalle;

  DallESuccess({required this.version, required this.dalle})
      : super(propss: [version, dalle]);
}

class DallEFailed extends DallEState {
  final int version;
  final String error;

  DallEFailed({required this.version, required this.error})
      : super(propss: [version, error]);
}
