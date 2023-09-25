import 'package:flix_movie/domain/entities/user/user.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final User user;

  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Text(user.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
