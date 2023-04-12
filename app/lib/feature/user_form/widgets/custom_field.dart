import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomField extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  final String? error;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? widget;
  final Enum type;

  final ErrorType? errorType;
  const CustomField(
      {super.key,
      required this.type,
      required this.labelText,
      required this.textEditingController,
      this.error,
      this.onChanged,
      required this.obscureText,
      this.widget,
      required this.errorType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          key: key,
          controller: textEditingController,
          obscureText: obscureText,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              suffixIcon: widget,
              label: Text(labelText),
              border: const OutlineInputBorder()),
        ),
        const SizedBox(height: 2),
        if (error != null)
          if (type == errorType)
            Text(error ?? "",
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
        const SizedBox(height: 2),
      ],
    );
  }
}
