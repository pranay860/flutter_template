import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            Radio(value: 0, groupValue: 0, onChanged: (value) {}),
            const Text("Male"),
            Radio(value: 0, groupValue: 0, onChanged: (value) {}),
            const Text("Female"),
          ],
        ),
      ],
    );
  }
}
