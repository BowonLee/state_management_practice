import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
repositoryProvider(Ref ref) {
  return Repository();
}

// fake repository
class Repository {
  Future<void> request() async {}
}
