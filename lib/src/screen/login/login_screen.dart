import 'package:quizapp/src/exports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();
  @override
  Widget build(context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppTextField(hint: "Email", controller: emailCtl),
            verticalGap(),
            AppTextField(hint: "Password", controller: passwordCtl),
            verticalGap(),
            Consumer(builder: (context, watch, child) {
              return AppButton(
                data: "Login",
                onPressed: () {
                  watch
                      .read(authProvider.notifier)
                      .login(emailCtl.text, passwordCtl.text)
                      .then((value) {
                    if (watch.watch(authProvider).isAuthenticated) {
                      TokenUtil()
                          .saveToken(watch.watch(authProvider).user!.token)
                          .then((value) {
                        GoRouter.of(context).go('/home');
                      });
                    } else {
                      print(watch.watch(authProvider).error);
                    }
                  });
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
