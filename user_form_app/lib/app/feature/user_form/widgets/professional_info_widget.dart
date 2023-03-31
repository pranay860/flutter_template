import 'package:flutter/material.dart';

class ProfessionalInfoWidget extends StatelessWidget {
  const ProfessionalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Professional Info",
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16)),
        const SizedBox(height: 15),
        TextFormField(
          decoration: const InputDecoration(
              label: Text("Experience*"),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField(
          items: [],
          onChanged: (va) {},
          decoration: const InputDecoration(
              label: Text("Designation*"),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField(
          items: [],
          onChanged: (va) {},
          decoration: const InputDecoration(
              label: Text("Domain*"),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder()),
        ),
      ],
    );
  }
}
