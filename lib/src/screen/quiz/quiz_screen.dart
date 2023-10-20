import '../../exports.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({Key? key}) : super(key: key);
  @override
  Widget build(context, ref) {
    final data = ref.watch(questionListProvider);

    return Scaffold(
      body: data.when(
        data: (data) {
          return PageView.builder(
            itemCount: data.data!.length,
            itemBuilder: (context, index) {
              var f = data.data![index];
              return Column(
                children: [
                  Text(f.questionText!.toLowerCase()),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: f.options!.length,
                    itemBuilder: (context, i) {
                      var d = f.options![i];
                      return ListTile(
                        title: Text(d.text.toString()),
                        onTap: () {},
                      );
                    },
                  )
                ],
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
