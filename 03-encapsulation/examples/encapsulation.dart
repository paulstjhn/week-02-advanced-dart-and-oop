// ─────────────────────────────────────────────────────────────────────────
// EXAMPLES — Encapsulation
// Run: dart run encapsulation.dart
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  print('=== Bank Account with Encapsulation ===');
  var account = BankAccount('Alice', 1000.0);
  account.printStatement();

  account.deposit(500.0);
  account.withdraw(200.0);
  account.withdraw(5000.0); // should be declined

  account.printStatement();

  print('\n=== Person with Validated Age ===');
  stdout.write('Enter your name: ');
  String name = stdin.readLineSync() ?? 'Unknown';

  stdout.write('Enter your age: ');
  int age = int.parse(stdin.readLineSync() ?? '0');

  var person = Person(name, age);
  print(person);

  stdout.write('Enter new age to update: ');
  int newAge = int.parse(stdin.readLineSync() ?? '0');
  person.age = newAge; // goes through setter validation
  print(person);

  print('\n=== Rectangle Computed Getters ===');
  stdout.write('Enter width: ');
  double w = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter height: ');
  double h = double.parse(stdin.readLineSync() ?? '0');

  var rect = Rectangle(w, h);
  print('Area:      ${rect.area.toStringAsFixed(2)}');
  print('Perimeter: ${rect.perimeter.toStringAsFixed(2)}');
}

// ── Classes ──────────────────────────────────────────────────────────────

class BankAccount {
  final String owner;  // final — cannot change after creation
  double _balance;     // private — only changed through methods

  BankAccount(this.owner, this._balance);

  // Read-only getter — outside world can read but not directly write
  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      print('  Invalid deposit amount: $amount');
      return;
    }
    _balance += amount;
    print('  Deposited \$${amount.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('  Invalid withdrawal amount');
      return;
    }
    if (amount > _balance) {
      print('  Insufficient funds — balance: \$${_balance.toStringAsFixed(2)}');
      return;
    }
    _balance -= amount;
    print('  Withdrew \$${amount.toStringAsFixed(2)}');
  }

  void printStatement() {
    print('  $owner | Balance: \$${_balance.toStringAsFixed(2)}');
  }
}

class Person {
  String _name;
  int    _age;

  Person(this._name, this._age);

  String get name => _name;
  int    get age  => _age;

  // Computed getter — no stored field, derived from _age
  String get status => _age >= 18 ? 'Adult' : 'Minor';

  set name(String value) {
    if (value.trim().isEmpty) {
      print('  Name cannot be empty');
      return;
    }
    _name = value;
  }

  set age(int value) {
    if (value < 0 || value > 150) {
      print('  Invalid age: $value — must be 0–150');
      return;
    }
    _age = value;
  }

  @override
  String toString() => '$_name | Age: $_age | Status: $status';
}

class Rectangle {
  final double _width;
  final double _height;

  Rectangle(this._width, this._height);

  // Computed — not stored, calculated fresh each time
  double get area      => _width * _height;
  double get perimeter => 2 * (_width + _height);
}
