import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Repository clientRepository(Ref ref) {
  return Repository();
}

// fake repository
class Repository {
  Future<void> request() async {
    await Future.delayed(const Duration(seconds: 3));
    Logger().i("real request");
  }
}
