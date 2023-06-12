import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_practice/riverpod/riverpod/custom_exception.dart';
import 'package:state_management_practice/riverpod/riverpod/repository.dart';
import 'package:state_management_practice/riverpod/riverpod/provider_state.dart';

part 'provider.g.dart';

@riverpod
String singleValue(Ref ref) {
  return "This is Value";
}

@riverpod
String singleValueWithParam(Ref ref, {required int param}) {
  return "This is Value and param is $param";
}

@riverpod
Future<String> futureValue(Ref ref) {
  return Future.delayed(
    const Duration(milliseconds: 500),
    () => "Future is here",
  );
}

@riverpod
Stream<int> streamValue(Ref ref) {
  return Stream.periodic(
    const Duration(milliseconds: 500),
    (computationCount) {
      return computationCount;
    },
  );
}

@riverpod
class ValueNotifier extends _$ValueNotifier {
  @override
  int build() {
    /// initial

    Logger().i("build Value Notifier");
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

@riverpod
class NoneValueNotifier extends _$NoneValueNotifier {
  @override
  build() {
    /// initial

    Logger().i("build Value Notifier");
  }
}

@riverpod
class FutureNotifier extends _$FutureNotifier {
  int _counter = 0;

  @override
  FutureOr<int> build() async {
    await Future.delayed(Duration(seconds: 1));

    return _counter;
  }

  void increment() async {
    state = const AsyncValue.loading();
    _counter++;
    await Future.delayed(Duration(seconds: 1));
    state = AsyncValue.data(_counter);
  }

  void decrement() async {
    state = const AsyncValue.loading();
    _counter--;
    await Future.delayed(Duration(seconds: 1));
    state = AsyncValue.data(_counter);
  }
}

@riverpod
class SampleStateNotifier extends _$SampleStateNotifier {
  late final Repository repository;

  @override
  BaseSampleState build() {
    repository = ref.watch(clientRepositoryProvider);
    return SampleLoading();
  }

  getData() async {
    try {
      state = SampleLoading();
      final resp = await repository.request();
      state = SampleSuccess(code: resp);
    } on CustomException catch (e) {
      state = SampleError();
    } on Exception catch (e) {
      state = SampleError();
    }
  }
}
