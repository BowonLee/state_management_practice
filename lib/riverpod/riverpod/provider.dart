import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
String singleValue(Ref ref) {
  return "Value";
}

@riverpod
Future<String> futureValue(Ref ref) async {
  return Future.delayed(
    const Duration(milliseconds: 500),
    () => "Future is here",
  );
}

@riverpod
Stream<int> streamValue(Ref ref) async* {
  for (int i = 0; i <= 5; i++) {
    await Future.delayed(const Duration(milliseconds: 500));
    yield i;
  }
}
