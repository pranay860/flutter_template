import 'package:flutter/material.dart';

final educationList = <String>[
  "Post Graduate",
  "Graduate",
  "HSC/Diploma",
  "SSC"
];

int currentYear = DateTime.now().year;
int startingYear = 2000;
List<String> yearList = List.generate((currentYear - startingYear) + 1,
    (index) => (startingYear + index).toString());

final stateList = <String>[
  "Maharashtra",
  "Gujarat",
  "Karnataka",
  "Madhya Pradesh",
  "Delhi",
  "Others"
];
final List<Locale> languageCode = [const Locale("en"), const Locale("es")];
