// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "Register" : MessageLookupByLibrary.simpleMessage("Register"),
    "appname" : MessageLookupByLibrary.simpleMessage("MyApName"),
    "confirmpassword" : MessageLookupByLibrary.simpleMessage("Confirm password*"),
    "confirmpasswordMessage" : MessageLookupByLibrary.simpleMessage("Password does not match with provided password"),
    "email" : MessageLookupByLibrary.simpleMessage("Email*"),
    "emailMessage" : MessageLookupByLibrary.simpleMessage("Invalid email"),
    "female" : MessageLookupByLibrary.simpleMessage("Female"),
    "firstMessage" : MessageLookupByLibrary.simpleMessage("The first name must contain more than 3 characters"),
    "firstname" : MessageLookupByLibrary.simpleMessage("First Name*"),
    "gender" : MessageLookupByLibrary.simpleMessage("Gender"),
    "lastNameMessage" : MessageLookupByLibrary.simpleMessage("The last name must contain more than 3 characters"),
    "lastname" : MessageLookupByLibrary.simpleMessage("Last Name*"),
    "male" : MessageLookupByLibrary.simpleMessage("Male"),
    "password" : MessageLookupByLibrary.simpleMessage("Password*"),
    "passwordMessage" : MessageLookupByLibrary.simpleMessage("Password must contains characters, numbers and one special character"),
    "phoneMessage" : MessageLookupByLibrary.simpleMessage("Invalid mobile number"),
    "phonenumber" : MessageLookupByLibrary.simpleMessage("Phone Number*")
  };
}
