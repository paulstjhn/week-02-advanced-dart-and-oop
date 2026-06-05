// ─────────────────────────────────────────────────────────────────────────
// EXAMPLES — Error Handling
// Run: dart run error_handling.dart
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  // ── 1. Basic try/catch ─────────────────────────────────────────────────
  print('=== Basic try/catch ===');
  try {
    int result = int.parse('not a number'); // throws FormatException
    print('Result: $result');               // never reached
  } catch (e) {
    print('Caught: $e');
  } finally {
    print('finally always runs');
  }

  // ── 2. Specific exception types ────────────────────────────────────────
  print('
=== Specific Exceptions ===');
  List<String> inputs = ['42', 'abc', '', '999'];

  for (String input in inputs) {
    try {
      int value = int.parse(input);
      if (value > 100) throw RangeError('Value $value exceeds maximum of 100');
      print('  Valid: $value');
    } on FormatException {
      print('  "$input" is not a valid integer');
    } on RangeError catch (e) {
      print('  Range error: $e');
    }
  }

  // ── 3. Custom exception ────────────────────────────────────────────────
  print('
=== Custom Exception ===');
  try {
    var account = SafeAccount('Alice', 200.0);
    account.withdraw(500.0); // throws InsufficientFundsException
  } on InsufficientFundsException catch (e) {
    print('Transaction failed: $e');
  }

  // ── 4. Safe input loop — keeps asking until valid ──────────────────────
  print('
=== Safe Input Loop ===');
  int age = readValidAge();
  print('Age accepted: $age');

  double amount = readPositiveAmount('deposit');
  print('Amount accepted: \$${amount.toStringAsFixed(2)}');
}

// ── Custom Exception ─────────────────────────────────────────────────────

class InsufficientFundsException implements Exception {
  final double requested;
  final double available;
  InsufficientFundsException(this.requested, this.available);

  @override
  String toString() =>
      'Requested \$${requested.toStringAsFixed(2)} but only \$${available.toStringAsFixed(2)} available';
}

class SafeAccount {
  String owner;
  double _balance;
  SafeAccount(this.owner, this._balance);

  void withdraw(double amount) {
    if (amount <= 0)        throw ArgumentError('Amount must be positive');
    if (amount > _balance)  throw InsufficientFundsException(amount, _balance);
    _balance -= amount;
    print('  Withdrew \$${amount.toStringAsFixed(2)}');
  }
}

// ── Safe input helpers ───────────────────────────────────────────────────

int readValidAge() {
  // while(true) + return on success is the cleanest re-prompt pattern
  while (true) {
    stdout.write('Enter your age (0-120): ');
    try {
      int age = int.parse(stdin.readLineSync() ?? '');
      if (age < 0 || age > 120) throw RangeError('out of range');
      return age; // valid — exits the loop
    } on FormatException {
      print('  Please enter a whole number');
    } on RangeError {
      print('  Age must be between 0 and 120');
    }
  }
}

double readPositiveAmount(String label) {
  while (true) {
    stdout.write('Enter $label amount: ');
    try {
      double amount = double.parse(stdin.readLineSync() ?? '');
      if (amount <= 0) throw ArgumentError('must be positive');
      return amount;
    } on FormatException {
      print('  Please enter a valid number');
    } on ArgumentError {
      print('  Amount must be greater than zero');
    }
  }
}
