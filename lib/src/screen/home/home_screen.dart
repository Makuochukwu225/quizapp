import 'package:quizapp/src/exports.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(context, ref) {
    final data = ref.watch(questionListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () {
                var refresh = ref.refresh(questionListProvider);
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: data.when(
        data: (data) => Center(
          child: AppButton(
            data: "Take Quiz",
            onPressed: () {
              GoRouter.of(context).go('/quiz');
            },
          ),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
