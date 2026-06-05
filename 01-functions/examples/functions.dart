// ─────────────────────────────────────────────────────────────────────────
// EXAMPLES — Functions in Dart
// Run: dart run functions.dart
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  // ── 1. Basic function call ───────────────────────────────────────────
  print('=== Basic Function ==');
  greet('Alice');
  greet('Bob');

  // ── 2. Return values ────────────────────────────────────────────────
  print('
=== Return Values ===');
  int sum = add(10, 5);
  print('10 + 5 = $sum');
  print('3 x 4 = ${multiply(3, 4)}'); // use return value directly

  // ── 3. Optional parameters ─────────────────────────────────────────
  print('
=== Optional Parameters ===');
  introduce('Alice');
  introduce('Bob', 'Admin');

  // ── 4. Named parameters ────────────────────────────────────────────
  print('
=== Named Parameters ===');
  printProfile(name: 'Charlie', age: 25);
  printProfile(name: 'Diana');   // age defaults to 0

  // ── 5. Arrow functions ─────────────────────────────────────────────
  print('
=== Arrow Functions ===');
  print('Square of 6: ${square(6)}');
  print('Max of 8 and 13: ${max(8, 13)}');

  // ── 6. User input passed to a function ────────────────────────────
  print('
=== User Input ===');
  stdout.write('Enter your name: ');
  String name = stdin.readLineSync() ?? 'stranger';

  stdout.write('Enter your age: ');
  int age = int.parse(stdin.readLineSync() ?? '0');

  // Pass the input to functions — the functions don't care where
  // the values came from (hardcoded or user input).
  greet(name);
  printAgeMessage(name, age);
}

// ── Function definitions ─────────────────────────────────────────────────

void greet(String name) {
  print('Hello, $name!');
}

int add(int a, int b) {
  return a + b;
}

// Arrow shorthand — single expression functions
int multiply(int a, int b) => a * b;
int square(int n)           => n * n;
int max(int a, int b)       => a > b ? a : b;

// Optional parameter with default value
void introduce(String name, [String role = 'Member']) {
  print('$name — $role');
}

// Named parameters — {} syntax, required keyword for mandatory ones
void printProfile({required String name, int age = 0}) {
  print('Name: $name | Age: $age');
}

void printAgeMessage(String name, int age) {
  String category = age < 18 ? 'a minor' : age < 65 ? 'an adult' : 'a senior';
  print('$name is $category at $age years old.');
}
