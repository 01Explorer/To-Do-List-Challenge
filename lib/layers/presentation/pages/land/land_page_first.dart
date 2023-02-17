import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';

import '../../controllers/land_page_controller.dart';

class LandPage extends StatefulWidget {
  final LandPageController controller;
  const LandPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<LandPage> createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {
  final _formKey = GlobalKey<FormState>();
  bool barIsVisible = false;
  double buttonHeight = 0;
  double buttonWidth = 0;

  final TextEditingController nameInputController = TextEditingController();

  _changeButtonSize() {
    setState(() {
      buttonWidth = MediaQuery.of(context).size.width * 0.8;
      buttonHeight = 40;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Hello!',
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  speed: const Duration(milliseconds: 50),
                ),
                TyperAnimatedText(
                  'Welcome to Tasky!',
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  speed: const Duration(milliseconds: 50),
                ),
                TyperAnimatedText(
                  'What\'s your name?',
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  speed: const Duration(milliseconds: 45),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () => setState(() {
                barIsVisible = !barIsVisible;
              }),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimatedContainer(
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: barIsVisible
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Theme.of(context).textTheme.headlineLarge!.color),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    enabled: barIsVisible,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                    validator: (value) {
                      if (value!.length > 1) {
                        nameInputController.text = value;
                        return null;
                      }
                      return 'Try a valid name';
                    },
                    onEditingComplete: () {
                      if (_formKey.currentState!.validate()) {
                        _changeButtonSize();
                      }
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AnimatedContainer(
              width: buttonWidth,
              height: buttonHeight,
              duration: const Duration(milliseconds: 500),
              child: ElevatedButton(
                  onPressed: () {
                    widget.controller.signUser(nameInputController.text);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeTaskPage(),
                    ));
                  },
                  child: const Text('Continue')),
            )
          ],
        ),
      ),
    );
  }
}
