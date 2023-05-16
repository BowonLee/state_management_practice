import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:state_management_practice/riverpod/riverpod/custom_exception.dart';
import 'package:state_management_practice/riverpod/riverpod/provider.dart';
import 'package:state_management_practice/riverpod/riverpod/provider_state.dart';
import 'package:state_management_practice/riverpod/riverpod/repository.dart';

import 'provider_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  group("simple test", () {
    int number = 0;

    setUp(() {
      number++;
    });

    test("number is 1 ", () {
      final testNumber = 1;

      expect(testNumber, 1);
    });

    test("number is 1 ", () {
      final testNumber = 1;

      expect(testNumber, 1);
    });
  });

  group("provider test", () {
    final MockRepository repository = MockRepository();
    final container = ProviderContainer();
    late SampleStateNotifier notifier;

    setUpAll(() {
      notifier = container.read(sampleStateNotifierProvider.notifier);
    });

    group("request is success", () {
      setUp(() {
        notifier = container.read(sampleStateNotifierProvider.notifier);
        // when(repository.request()).thenAnswer((realInvocation) => Future(() => null));
      });
      test("init", () {
        expect(notifier.state, isA<SampleLoading>());
      });

      test("success", () async {
        expect(notifier.state, isA<SampleLoading>());
        // await notifier.getData();
        expect(notifier.state, isA<SampleSuccess>());
        // verify(notifier.onSuccessProcess());
        // verifyNever(notifier.handleCustomException());
      });

      test("forceError", () async {
        expect(notifier.state, isA<SampleLoading>());
        // await notifier.getData(occurException: true);
        expect(notifier.state, isA<SampleError>());
        // verifyNever(notifier.onSuccessProcess());
        // verify(notifier.handleCustomException());
      });
    });

    group("request is exception", () {
      setUp(() {
        // notifier = container.read(sampleStateNotifierProvider.notifier);
      });
      test("success", () async {
        final container =
            ProviderContainer(overrides: [clientRepositoryProvider.overrideWithValue(repository)]);
        when(repository.request()).thenThrow(CustomException());
        final sampleState = container.read(sampleStateNotifierProvider.notifier);

        expect(sampleState.state, isA<SampleLoading>());
        await sampleState.getData();
        expect(sampleState.state, isA<SampleError>());
      });
    });
  });
}
