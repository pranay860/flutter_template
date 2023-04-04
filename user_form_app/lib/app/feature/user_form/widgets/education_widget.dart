import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:my_app/app/utils/menu_items.dart';

class EducationWdiget extends StatelessWidget {
  final UserPageViewModel model;
  const EducationWdiget({super.key, required this.model});

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
          items: educationList
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) => model.changeDegree(value!),
          validator: (value) => value == null ? "Degree is required" : null,
          decoration: const InputDecoration(
            label: Text("Education*"),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField(
          items: yearList
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          validator: (value) =>
              value == null ? "Passing year is required" : null,
          onChanged: (value) => model.changePassingYear(value!),
          decoration: const InputDecoration(
              label: Text("Year of Passing*"), border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        TextFormField(
          validator: (value) => value == null
              ? null
              : value.isEmpty
                  ? "Grade is required"
                  : null,
          controller: model.gradeController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_.-]*$')),
          ],
          decoration: const InputDecoration(
              label: Text("Grade*"), border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
