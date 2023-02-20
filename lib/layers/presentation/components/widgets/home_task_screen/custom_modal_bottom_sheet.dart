import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../locator.dart';
import '../../../controllers/land_page_controller.dart';
import '../../../controllers/theme_manager_controller.dart';

class CustomModalBottomSheet extends StatelessWidget {
  CustomModalBottomSheet({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Switch(
                  value: locator.get<ThemeManagerController>().themeMode ==
                      ThemeMode.dark,
                  onChanged: (value) {
                    locator.get<ThemeManagerController>().toggleTheme(value);
                  })
            ],
          ),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit your name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Form(
                          key: formKey,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                            validator: (value) {
                              if (value!.length > 1) {
                                nameEditController.text = value;
                                return null;
                              }
                              return 'Try a valid name';
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                child: Text(
                                  'Cancel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    locator
                                        .get<LandPageController>()
                                        .signUser(nameEditController.text);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Name changed!')));
                                  }
                                },
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                child: Text(
                                  'Confirm',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(
              'Edit user name',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
