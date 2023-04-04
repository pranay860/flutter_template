import 'package:flutter/material.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:my_app/app/utils/enums.dart';

class GenderWidget extends StatelessWidget {
  final UserPageViewModel model;
  const GenderWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            Radio(
                value: Gender.male,
                groupValue: model.genderValue,
                onChanged: (value) {
                  model.changeGender(value!);
                }),
            const Text("Male"),
            Radio(
                value: Gender.female,
                groupValue: model.genderValue,
                onChanged: (value) {
                  model.changeGender(value!);
                }),
            const Text("Female"),
          ],
        ),
      ],
    );
  }
}
