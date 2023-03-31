import 'package:flutter/material.dart';

import 'widgets/widget_exports.dart';


class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Your Address",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black))),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Address*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("LandMark*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("City*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  items: [],
                  onChanged: (va) {},
                  decoration: const InputDecoration(
                      label: Text("Select your state*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Pincode"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                ButtonWidget(
                  showButton: false,
                  buttonName: "Submit",
                  onNext: () {},
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
