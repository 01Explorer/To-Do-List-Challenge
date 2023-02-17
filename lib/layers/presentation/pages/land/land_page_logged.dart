import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/land_page_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';

class LandPageLogged extends StatefulWidget {
  final LandPageController controller;
  const LandPageLogged({super.key, required this.controller});

  @override
  State<LandPageLogged> createState() => _LandPageLoggedState();
}

class _LandPageLoggedState extends State<LandPageLogged> {
  Future _welcomeThenNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeTaskPage(),
    ));
  }

  @override
  void initState() {
    _welcomeThenNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedTextKit(animatedTexts: [
        TyperAnimatedText(
          'Hello!',
          textStyle: Theme.of(context).textTheme.headlineLarge,
          speed: const Duration(milliseconds: 50),
        ),
        TyperAnimatedText(
          'Welcome back ${widget.controller.getUser()}!',
          textStyle: Theme.of(context).textTheme.headlineLarge,
          speed: const Duration(milliseconds: 25),
        ),
      ])),
    );
  }
}
