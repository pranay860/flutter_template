import 'package:flutter/material.dart';
import 'package:my_app/app/routes/route_paths.dart';
import 'widgets/widget_exports.dart';


class EducationForm extends StatelessWidget {
  const EducationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Your Info",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Form(
            child: Column(children: [
              const SizedBox(height: 20),
              const EducationWdiget(),
              const SizedBox(height: 15),
              const Divider(thickness: 1.5),
              const SizedBox(height: 15),
              const ProfessionalInfoWidget(),
              const SizedBox(height: 15),
              ButtonWidget(
                showButton: true,
                onNext: () {
                  Navigator.pushNamed(context, RoutePaths.address);
                },
                onPrev: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15)
            ]),
          ),
        ),
      ),
    );
  }
}
