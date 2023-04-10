import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final bool showButton;
  final Function()? onNext;
  final Function()? onPrev;
  final String? buttonName;
  const ButtonWidget(
      {super.key,
      required this.showButton,
      required this.onNext,
      this.onPrev,
      this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showButton
            ? Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                          onPressed: onPrev, child: const Text("Previous")),
                    )),
                    const SizedBox(width: 10),
                  ],
                ),
              )
            : Container(),
        Expanded(
            child: SizedBox(
          height: 50,
          child: ElevatedButton(
              onPressed: onNext, child: Text(buttonName ?? "Next")),
        )),
      ],
    );
  }
}
