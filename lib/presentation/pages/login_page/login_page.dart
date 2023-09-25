import 'package:flix_movie/data/dummies/dummy_authentication.dart';
import 'package:flix_movie/data/dummies/dummy_user_repository.dart';
import 'package:flix_movie/data/firebase/firebase_authentication.dart';
import 'package:flix_movie/data/firebase/firebase_user_repository.dart';
import 'package:flix_movie/domain/usecases/login/login.dart';
import 'package:flix_movie/presentation/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Login login = Login(
                      authentication: FirebaseAuthentication(),
                      userRepository: FirebaseUserRepository(),
                    );

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
