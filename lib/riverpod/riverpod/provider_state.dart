class BaseSampleState {}

class SampleLoading extends BaseSampleState {}

class SampleSuccess extends BaseSampleState {
  final int code;

  SampleSuccess({
    required this.code,
  });
}

class SampleError extends BaseSampleState {}
