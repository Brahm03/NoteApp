import 'package:flutter/foundation.dart';

class EmailAdress {
  final String value;

  factory EmailAdress(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return EmailAdress._(
      validateEmailAdress(input),
    );
  }

  const EmailAdress._(this.value);

  @override
  bool operator ==(covariant EmailAdress other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'EmailAdress(value: $value)';
}

String validateEmailAdress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailException(errorValue: input);
  }
}

class InvalidEmailException implements Exception {
  final String errorValue;

  InvalidEmailException({required this.errorValue});
}
