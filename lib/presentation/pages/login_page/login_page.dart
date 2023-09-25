import 'package:flix_movie/domain/usecases/login/login.dart';
import 'package:flix_movie/presentation/pages/main_page/main_page.dart';
import 'package:flix_movie/presentation/providers/usecases/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Login login = ref.watch(loginProvider);

                    login(LoginParams(
                            email: 'devs.randi@gmail.com', password: '123456'))
                        .then((result) {
                      if (result.isSuccess) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MainPage(user: result.resultValue!),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(result.errorMessage!),
                        ));
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
