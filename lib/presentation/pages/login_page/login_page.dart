import 'package:flix_movie/presentation/extensions/build_context_extension.dart';
import 'package:flix_movie/presentation/providers/router/router_provider.dart';
import 'package:flix_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_movie/presentation/widgets/flix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

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
          context.showSnacbar(next.error.toString());
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              FlixTextField(
                labelText: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  ref
                      .read(userDataProvider.notifier)
                      .login(email: 'devs.randi@gmail.com', password: '123456');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
