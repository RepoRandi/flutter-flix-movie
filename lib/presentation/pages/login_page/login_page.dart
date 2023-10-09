import 'package:flix_movie/presentation/providers/router/router_provider.dart';
import 'package:flix_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');
          }
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      },
    );

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
                    ref.read(userDataProvider.notifier).login(
                        email: 'devs.randi@gmail.com', password: '123456');
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
