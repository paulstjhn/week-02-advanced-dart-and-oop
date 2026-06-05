// ─────────────────────────────────────────────────────────────────────────
// ASSIGNMENT 1 — Bank Account with Transaction History
// Your name:
// Date:
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  // ── Step 1: Read account details from the user ─────────────────────────
  stdout.write('Account holder name: ');
  String name = stdin.readLineSync() ?? 'Account Holder';

  stdout.write('Starting balance: ');
  double balance = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Set a 4-digit PIN: ');
  String pin = stdin.readLineSync() ?? '0000';

  // ── Step 2: Create the BankAccount object ──────────────────────────────
  // TODO: Uncomment and use once your class is ready
  // var account = BankAccount(name, balance, 'ACC-2024', pin);

  // ── Step 3: Simulate the transactions ─────────────────────────────────
  // TODO: Call the appropriate methods in the correct order.
  //       Use the correct PIN for valid operations and a wrong one
  //       for the failed deposit test.

  print('Simulation goes here...');
}

// ── TODO: Implement the BankAccount class below ────────────────────────────

class BankAccount {
  // TODO: Declare private fields
  //   _owner, _balance, _accountNumber, _transactions, _pin

  // TODO: Constructor

  // TODO: Getters for owner, balance, accountNumber

  // TODO: verifyPin(String input) → bool

  // TODO: deposit(String pin, double amount)

  // TODO: withdraw(String pin, double amount)

  // TODO: printBalance(String pin)

  // TODO: printStatement(String pin)

  void _addToLog(String entry) {
    // Helper — adds a line to the transaction list
    // TODO: implement
  }

  void _printDivider() => print('──────────────────────────────────');
}
