import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  // return Stream.fromIterable([1, 2, 3]);
}

@riverpod
class ValueNotifier extends _$ValueNotifier {
  @override
  List<String> build() {
    /// build 의 반환값에 따라서 값이 변경되며, 여기 설정 된 기본 값이  state의 초기값이다.
    /// init 관련 값들을 여기에서 셋팅하면 된다.

    ref.watch(futureValueProvider);
    return [];
  }
}
