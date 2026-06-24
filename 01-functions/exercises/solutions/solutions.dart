// ─────────────────────────────────────────────────────────────────────────
// SOLUTIONS — Functions
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  print('── Exercise 1 ──────────────────────────');
  exercise1();
  print('\n── Exercise 2 ──────────────────────────');
  exercise2();
  print('\n── Exercise 3 ──────────────────────────');
  exercise3();
  print('\n── Exercise 5 ──────────────────────────');
  exercise5();
}

// ══════════════════════════════════════════════════════════════════
// Exercise 1 — Temperature Converter  🟢
// ══════════════════════════════════════════════════════════════════

// Pure functions — they only work with what they receive.
// No reading from console, no printing — just calculation.
// This keeps them testable and reusable anywhere.
double celsiusToFahrenheit(double c) => (c * 9 / 5) + 32;
double fahrenheitToCelsius(double f) => (f - 32) * 5 / 9;

void exercise1() {
  stdout.write('Enter temperature: ');
  double temp = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter unit (C/F): ');
  String unit = (stdin.readLineSync() ?? 'C').toUpperCase();

  if (unit == 'C') {
    double result = celsiusToFahrenheit(temp);
    print('${temp}°C = ${result.toStringAsFixed(1)}°F');
  } else {
    double result = fahrenheitToCelsius(temp);
    print('${temp}°F = ${result.toStringAsFixed(1)}°C');
  }
}

// ══════════════════════════════════════════════════════════════════
// Exercise 2 — Simple Calculator  🟢
// ══════════════════════════════════════════════════════════════════

double add(double a, double b)      => a + b;
double subtract(double a, double b) => a - b;
double multiply(double a, double b) => a * b;
double divide(double a, double b)   => b != 0 ? a / b : 0;
// Note: divide checks for zero before dividing — division by zero
// would throw an error. A simple guard like this prevents the crash.

void exercise2() {
  stdout.write('Enter first number: ');
  double a = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter second number: ');
  double b = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter operator (+, -, *, /): ');
  String op = stdin.readLineSync() ?? '+';

  double result;
  switch (op) {
    case '+': result = add(a, b);      break;
    case '-': result = subtract(a, b); break;
    case '*': result = multiply(a, b); break;
    case '/': result = divide(a, b);   break;
    default:  result = 0; print('Unknown operator');
  }

  print('$a $op $b = ${result.toStringAsFixed(2)}');
}

// ══════════════════════════════════════════════════════════════════
// Exercise 3 — Grade Classifier  🟡
// ══════════════════════════════════════════════════════════════════

// Optional parameter [subject] defaults to 'General' if not provided.
String classifyGrade(int score, [String subject = 'General']) {
  String grade = score >= 90 ? 'A'
               : score >= 80 ? 'B'
               : score >= 70 ? 'C'
               : score >= 60 ? 'D'
               : 'F';
  print('Subject: $subject | Score: $score | Grade: $grade');
  return grade;
}

void exercise3() {
  stdout.write('Enter subject name: ');
  String subject = stdin.readLineSync() ?? 'General';

  stdout.write('Enter score: ');
  int score = int.parse(stdin.readLineSync() ?? '0');

  classifyGrade(score, subject);
}

// ══════════════════════════════════════════════════════════════════
// Exercise 5 — Number Utilities  🔴
// ══════════════════════════════════════════════════════════════════

bool isPrime(int n) {
  if (n < 2) return false;
  // Only check up to the square root — if n has a factor larger
  // than its square root, it also has one smaller than it.
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

int factorial(int n) {
  if (n <= 1) return 1;
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}

List<int> fibonacci(int count) {
  if (count <= 0) return [];
  if (count == 1) return [0];
  List<int> seq = [0, 1];
  for (int i = 2; i < count; i++) {
    // Each Fibonacci number is the sum of the previous two.
    seq.add(seq[i - 1] + seq[i - 2]);
  }
  return seq;
}

bool isPalindrome(String word) {
  String clean = word.toLowerCase();
  // Compare the word with its reverse.
  return clean == clean.split('').reversed.join('');
}

void exercise5() {
  stdout.write('Enter a positive number: ');
  int n = int.parse(stdin.readLineSync() ?? '5');

  print('$n is prime:        ${isPrime(n)}');
  print('$n! =               ${factorial(n)}');
  print('First $n Fibonacci: ${fibonacci(n)}');

  stdout.write('Enter a word to check if palindrome: ');
  String word = stdin.readLineSync() ?? '';
  print('"$word" is a palindrome: ${isPalindrome(word)}');
}
