import 'package:app/feature/user_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfessionalInfoWidget extends StatelessWidget {
  final UserPageViewModel model;
  const ProfessionalInfoWidget({super.key, required this.model});

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
          keyboardType: TextInputType.number,
          controller: model.experienceController,
          decoration: const InputDecoration(
            label: Text("Experience*"),
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null) return null;
            if (value.isEmpty) return "Experience is required";
            return null;
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: model.designationController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_.-]*$')),
          ],
          decoration: const InputDecoration(
            label: Text("Designation*"),
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null) return null;
            if (value.isEmpty) return "Designation is required";
            return null;
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_.-]*$')),
          ],
          controller: model.domainController,
          decoration: const InputDecoration(
            label: Text("Domain"),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
