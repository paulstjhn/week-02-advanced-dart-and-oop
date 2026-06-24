// ─────────────────────────────────────────────────────────────────────────
// SOLUTIONS — Error Handling
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  print('── Exercise 1 ──────────────────────────');
  exercise1();
  print('\n── Exercise 2 ──────────────────────────');
  exercise2();
  print('\n── Exercise 3 ──────────────────────────');
  exercise3();
}

// ══════════════════════════════════════════════════════════════════
// Exercise 1 — Safe Number Reader  🟢
// ══════════════════════════════════════════════════════════════════

// Generic re-usable safe reader — works for any integer range.
// The while(true)/return pattern keeps asking until input is valid.
int readInteger(String prompt, int min, int max) {
  while (true) {
    stdout.write('$prompt ($min–$max): ');
    try {
      int value = int.parse(stdin.readLineSync() ?? '');
      if (value < min || value > max) {
        throw RangeError('Expected $min–$max, got $value');
      }
      return value;
    } on FormatException {
      print('  Please enter a whole number');
    } on RangeError catch (e) {
      print('  Out of range: $e');
    }
  }
}

void exercise1() {
  int score  = readInteger('Enter a score', 0, 100);
  int age    = readInteger('Enter your age', 0, 120);
  int choice = readInteger('Menu choice', 1, 4);

  print('Score: $score | Age: $age | Choice: $choice');
}

// ══════════════════════════════════════════════════════════════════
// Exercise 2 — Division Guard  🟢
// ══════════════════════════════════════════════════════════════════

double safeDivide(double a, double b) {
  // We throw BEFORE dividing — the error has a meaningful message.
  if (b == 0) throw ArgumentError('Cannot divide by zero');
  return a / b;
}

void exercise2() {
  stdout.write('Enter numerator: ');
  double a = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter denominator: ');
  double b = double.parse(stdin.readLineSync() ?? '0');

  try {
    double result = safeDivide(a, b);
    print('$a / $b = ${result.toStringAsFixed(4)}');
  } on ArgumentError catch (e) {
    print('Error: $e');
  }
}

// ══════════════════════════════════════════════════════════════════
// Exercise 3 — Custom Validation Exceptions  🟡
// ══════════════════════════════════════════════════════════════════

class EmptyFieldException implements Exception {
  final String fieldName;
  EmptyFieldException(this.fieldName);
  @override String toString() => '$fieldName cannot be empty';
}

class InvalidRangeException implements Exception {
  final String field;
  final int min, max, actual;
  InvalidRangeException(this.field, this.min, this.max, this.actual);
  @override String toString() =>
      '$field must be between $min and $max (got $actual)';
}

class InvalidFormatException implements Exception {
  final String field, expected;
  InvalidFormatException(this.field, this.expected);
  @override String toString() => '$field format invalid — expected $expected';
}

void validateUserInput(String name, int age, String email) {
  if (name.trim().isEmpty) throw EmptyFieldException('Name');
  if (age < 0 || age > 120) throw InvalidRangeException('Age', 0, 120, age);
  if (!email.contains('@') || !email.contains('.')) {
    throw InvalidFormatException('Email', 'user@domain.com');
  }
}

void exercise3() {
  stdout.write('Name: ');  String name  = stdin.readLineSync() ?? '';
  stdout.write('Age: ');   String ageStr = stdin.readLineSync() ?? '0';
  stdout.write('Email: '); String email = stdin.readLineSync() ?? '';

  try {
    int age = int.parse(ageStr);
    validateUserInput(name, age, email);
    print('All inputs valid! Name: $name | Age: $age | Email: $email');
  } on FormatException {
    print('Age must be a number');
  } on EmptyFieldException catch (e) {
    print('Validation error: $e');
  } on InvalidRangeException catch (e) {
    print('Validation error: $e');
  } on InvalidFormatException catch (e) {
    print('Validation error: $e');
  }
}
