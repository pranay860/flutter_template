import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EducationWdiget extends StatelessWidget {
  const EducationWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Educational Info",
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16)),
        const SizedBox(height: 15),
        DropdownButtonFormField(
          items: [],
          onChanged: (va) {},
          decoration: const InputDecoration(
              label: Text("Education*"),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField(
          items: [],
          onChanged: (va) {},
          decoration: const InputDecoration(
              label: Text("Year of Passing*"),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: const InputDecoration(
              label: Text("Grade*"),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder()),
        ),
      ],
    );
  }
}
