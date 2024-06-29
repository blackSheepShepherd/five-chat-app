import 'package:flutter/services.dart';

class RegexValidator {
  /// Validates a string via its [isValid] method according to [regexSource].
  RegexValidator({required this.regexSource});
  final String regexSource;

  /// value: the input string
  /// returns: true if the input string is a full match for regexSource
  bool isValid(String value) {
    try {
      final regex = RegExp(regexSource);
      final matches = regex.allMatches(value);
      for (final Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}

class EmailEditingRegexValidator extends RegexValidator {
  EmailEditingRegexValidator()
      : super(
          regexSource:
              r'^[a-zA-Z0-9_.+-]*(@([a-zA-Z0-9-]*(\.[a-zA-Z0-9-]*)?)?)?$',
        );
}

class EmailSubmitRegexValidator extends RegexValidator {
  EmailSubmitRegexValidator()
      : super(
          regexSource: r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$)',
        );
}

class CodeEditingValidator extends RegexValidator {
  CodeEditingValidator()
      : super(
          regexSource: r'^[0-9]+$',
        );
}

//Minimum eight characters, at least one uppercase letter, one lowercase letter
//and one number
class PasswordRegexSubmitValidator extends RegexValidator {
  PasswordRegexSubmitValidator()
      : super(regexSource: r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
}

class NoSpaceRegexValidator extends RegexValidator {
  NoSpaceRegexValidator()
      : super(
          regexSource: '[^ ]*',
        );
}

class PhoneNumberCountryCodeEditRegexValidator extends RegexValidator {
  /// Validates the country code (Vorwahl) of a phone number.
  PhoneNumberCountryCodeEditRegexValidator()
      : super(
          /// This should match from the empty string to f.e. "49" or "36".
          regexSource: r'^\d{1,2}$',
        );
}

class PhoneNumberMainEditRegexValidator extends RegexValidator {
  /// Validates the main part of a phone number, without country code.
  PhoneNumberMainEditRegexValidator()
      : super(
          regexSource: r'^\d{1,12}$',
        );
}

class PhoneNumberSubmitRegexValidator extends RegexValidator {
  /// Validates a complete phone number, with country code and main part.
  /// Only numbers and length should be between 7 and 14 digits.
  PhoneNumberSubmitRegexValidator()
      : super(
          regexSource: r'^\d{7,14}$',
        );
}

class UsernameEditingRegexValidator extends RegexValidator {
  /// Validates that the user name is consisting of characters ;-)
  /// https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/
  /// Might run into a XSS injection though. So maybe change later?
  UsernameEditingRegexValidator()
      : super(
          regexSource: r'^.*$',
        );
}

class UsernameSubmitRegexValidator extends RegexValidator {
  /// Validates that the user name is consisting of characters ;-)
  /// https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/
  /// Might run into a XSS injection though. So maybe change later?
  UsernameSubmitRegexValidator()
      : super(
          regexSource: r'^.+$',
        );
}

class BirthDateEditingRegexValidator extends RegexValidator {
  /// Validates that the birthdate is only numbers and dots.
  BirthDateEditingRegexValidator()
      : super(
          regexSource: r'^[0-9.]*$',
        );
}

class BirthDateSubmitRegexValidator extends RegexValidator {
  /// Validates that the birthdate is valid (01.02.1983)
  BirthDateSubmitRegexValidator()
      : super(
          regexSource: r'^[0-9]{2}.[0-9]{2}.[0-9]{4}$',
        );
}

class ValidatorInputFormatter implements TextInputFormatter {
  /// Decides if a new value should be used or the old value should be kept.
  /// A new value will be used if the [editingValidator] says it's valid.
  ValidatorInputFormatter({required this.editingValidator});
  final RegexValidator editingValidator;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newValueValid = editingValidator.isValid(newValue.text);
    if (!newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}
