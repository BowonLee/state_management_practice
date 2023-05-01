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
                child: const Text("stream"))
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
