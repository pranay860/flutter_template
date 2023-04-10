// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null, 'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;
 
      return instance;
    });
  } 

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null, 'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `MyApName`
  String get appname {
    return Intl.message(
      'MyApName',
      name: 'appname',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `First Name*`
  String get firstname {
    return Intl.message(
      'First Name*',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `The first name must contain more than 3 characters`
  String get firstMessage {
    return Intl.message(
      'The first name must contain more than 3 characters',
      name: 'firstMessage',
      desc: '',
      args: [],
    );
  }

  /// `The last name must contain more than 3 characters`
  String get lastNameMessage {
    return Intl.message(
      'The last name must contain more than 3 characters',
      name: 'lastNameMessage',
      desc: '',
      args: [],
    );
  }

  /// `Invalid mobile number`
  String get phoneMessage {
    return Intl.message(
      'Invalid mobile number',
      name: 'phoneMessage',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get emailMessage {
    return Intl.message(
      'Invalid email',
      name: 'emailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password must contains characters, numbers and one special character`
  String get passwordMessage {
    return Intl.message(
      'Password must contains characters, numbers and one special character',
      name: 'passwordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match with provided password`
  String get confirmpasswordMessage {
    return Intl.message(
      'Password does not match with provided password',
      name: 'confirmpasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Last Name*`
  String get lastname {
    return Intl.message(
      'Last Name*',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number*`
  String get phonenumber {
    return Intl.message(
      'Phone Number*',
      name: 'phonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Email*`
  String get email {
    return Intl.message(
      'Email*',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password*`
  String get password {
    return Intl.message(
      'Password*',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password*`
  String get confirmpassword {
    return Intl.message(
      'Confirm password*',
      name: 'confirmpassword',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}