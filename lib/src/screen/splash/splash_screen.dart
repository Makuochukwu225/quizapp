import 'package:quizapp/src/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      var tokenUtil = TokenUtil().getToken();
      tokenUtil.then((token) {
        if (token != null) {
          GoRouter.of(context).go('/home');
        } else {
          GoRouter.of(context).go('/login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Quiz App'),
      ),
    );
  }
}
