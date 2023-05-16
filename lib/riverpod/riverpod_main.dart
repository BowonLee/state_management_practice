import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_practice/riverpod/riverpod/obserber/riverpod_observer.dart';
import 'package:state_management_practice/riverpod/riverpod/provider.dart';

ProviderScope getRiverpodMain() {
  return ProviderScope(
    observers: [CustomProviderObserver()],
    child: const MaterialApp(
      home: RiverpodMain(),
    ),
  );
}

class RiverpodMain extends StatelessWidget {
  const RiverpodMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("RiverPod")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _ValueTestScreen(),
                      ));
                },
                child: const Text("value")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _ValueWithParamTestScreen(),
                      ));
                },
                child: const Text("valueWithParam")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _FutureScreen(),
                      ));
                },
                child: const Text("future")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _StreamScreen(),
                      ));
                },
                child: const Text("stream")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _ValueNotifierScreen(),
                      ));
                },
                child: const Text("value notifier")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _FutureValueNotifierScreen(),
                      ));
                },
                child: const Text("future value notifier")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _StateValueNotifierScreen(),
                      ));
                },
                child: const Text("state value notifier")),
          ],
        ));
  }
}

class _ValueTestScreen extends ConsumerWidget {
  const _ValueTestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(singleValueProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("value")),
      body: Center(
        child: Text(value),
      ),
    );
  }
}

class _ValueWithParamTestScreen extends ConsumerWidget {
  const _ValueWithParamTestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(singleValueWithParamProvider(param: 512));

    return Scaffold(
      appBar: AppBar(title: const Text("value")),
      body: Center(
        child: Text(value),
      ),
    );
  }
}

class _FutureScreen extends ConsumerWidget {
  const _FutureScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(futureValueProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("future"),
      ),
      body: value.when(
        data: (data) => Center(
          child: Text(data),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _StreamScreen extends ConsumerWidget {
  const _StreamScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamValueProvider);

    return Scaffold(
      appBar: AppBar(title: Text("stream")),
      body: StreamBuilder(
        builder: (context, snapshot) => Center(
          child: Text("${snapshot.data}"),
        ),
        stream: stream,
      ),
    );
  }
}

class _ValueNotifierScreen extends ConsumerWidget {
  const _ValueNotifierScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueNotifier = ref.watch(valueNotifierProvider.notifier);
    final valueState = ref.watch(valueNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("value notifier"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text("state is $valueState"),
          ),
          ElevatedButton(
              onPressed: () {
                valueNotifier.increment();
              },
              child: const Text("increment")),
          ElevatedButton(
              onPressed: () {
                valueNotifier.decrement();
              },
              child: const Text("decrement")),
        ],
      ),
    );
  }
}

class _FutureValueNotifierScreen extends ConsumerWidget {
  const _FutureValueNotifierScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueNotifier = ref.watch(futureNotifierProvider.notifier);
    final valueState = ref.watch(futureNotifierProvider);

    /// state

    return Scaffold(
      appBar: AppBar(
        title: Text("future value notifier"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: valueState.when(
              data: (data) => Text("value is $data"),
              error: (error, stackTrace) => Text("error"),
              loading: () => CircularProgressIndicator(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                valueNotifier.increment();
              },
              child: const Text("increment")),
          ElevatedButton(
              onPressed: () {
                valueNotifier.decrement();
              },
              child: const Text("decrement")),
        ],
      ),
    );
  }
}

class _StateValueNotifierScreen extends ConsumerWidget {
  const _StateValueNotifierScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(sampleStateNotifierProvider.notifier);
    final sampleState = ref.watch(sampleStateNotifierProvider);

    /// state

    return Scaffold(
      appBar: AppBar(
        title: Text("future value notifier"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(sampleState.toString()),
          ),
          ElevatedButton(
              onPressed: () {
                stateNotifier.getData();
                // valueNotifier.increment();
              },
              child: const Text("getData")),
          ElevatedButton(
              onPressed: () {
                // valueNotifier.decrement();
              },
              child: const Text("getData")),
        ],
      ),
    );
  }
}
