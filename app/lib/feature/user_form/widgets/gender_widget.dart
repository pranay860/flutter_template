import 'package:app/feature/user_page_view_model.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';

class GenderWidget extends StatelessWidget {
  final UserPageViewModel model;
  const GenderWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.current.gender,
            style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            Radio<Enum>(
                value: Gender.male,
                groupValue: model.genderValue,
                onChanged: (value) {
                  model.changeGender(value!);
                }),
            Text(Strings.current.male),
            Radio<Enum>(
                value: Gender.female,
                groupValue: model.genderValue,
                onChanged: (value) {
                  model.changeGender(value!);
                }),
            Text(Strings.current.female),
          ],
        ),
      ],
    );
  }
}
