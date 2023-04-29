import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_practice/riverpod/riverpod/provider.dart';

getRiverpodMain() {
  return const ProviderScope(child: RiverpodMain());
}

class RiverpodMain extends StatelessWidget {
  const RiverpodMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("RiverPod")),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("value")),
            ElevatedButton(onPressed: () {}, child: const Text("future")),
            ElevatedButton(onPressed: () {}, child: const Text("stream"))
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
        loading: () => const CircularProgressIndicator(),
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
      body: Center(),
    );
  }
}
