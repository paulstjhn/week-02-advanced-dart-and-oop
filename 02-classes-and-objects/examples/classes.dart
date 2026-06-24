// ─────────────────────────────────────────────────────────────────────────
// EXAMPLES — Classes and Objects
// Run: dart run classes.dart
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  // ── 1. Creating and using objects ─────────────────────────────────────
  print('=== Bank Account Objects ===');
  var alice = BankAccount('Alice', 1000.0);
  var bob   = BankAccount('Bob',    500.0);

  alice.deposit(250.0);
  bob.withdraw(100.0);

  alice.printBalance();
  bob.printBalance();

  // ── 2. Named constructors ──────────────────────────────────────────────
  print('\n=== Temperature Named Constructors ===');
  var boiling  = Temperature(100);
  var bodyTemp = Temperature.fromFahrenheit(98.6);
  var absolute = Temperature.absoluteZero();

  print('Boiling:       ${boiling.celsius}°C');
  print('Body temp:     ${bodyTemp.celsius.toStringAsFixed(1)}°C');
  print('Absolute zero: ${absolute.celsius}°C');

  // ── 3. toString() override ─────────────────────────────────────────────
  print('\n=== toString() ===');
  var student = Student('Charlie', 91);
  print(student); // uses our custom toString()

  // ── 4. List of objects ─────────────────────────────────────────────────
  print('\n=== List of Objects ===');
  List<Student> students = [
    Student('Alice', 88),
    Student('Bob', 74),
    Student('Diana', 95),
  ];

  for (Student s in students) {
    print(s); // toString() called automatically
  }

  // ── 5. Object created from user input ──────────────────────────────────
  print('\n=== Create From User Input ===');
  stdout.write('Enter your name: ');
  String name = stdin.readLineSync() ?? 'Unknown';

  stdout.write('Enter starting balance: ');
  double balance = double.parse(stdin.readLineSync() ?? '0');

  var myAccount = BankAccount(name, balance);
  myAccount.printBalance();
}

// ── Class definitions ────────────────────────────────────────────────────

class BankAccount {
  String owner;
  double balance;

  BankAccount(this.owner, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('  Deposited \$${amount.toStringAsFixed(2)} → balance: \$${balance.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (amount > balance) {
      print('  Insufficient funds');
      return;
    }
    balance -= amount;
    print('  Withdrew \$${amount.toStringAsFixed(2)} → balance: \$${balance.toStringAsFixed(2)}');
  }

  void printBalance() {
    print('$owner\'s balance: \$${balance.toStringAsFixed(2)}');
  }
}

class Temperature {
  double celsius;

  Temperature(this.celsius);
  Temperature.fromFahrenheit(double f) : celsius = (f - 32) * 5 / 9;
  Temperature.absoluteZero() : celsius = -273.15;
}

class Student {
  String name;
  int    score;

  Student(this.name, this.score);

  String get grade => score >= 90 ? 'A'
                    : score >= 80 ? 'B'
                    : score >= 70 ? 'C'
                    : 'F';

  @override
  String toString() => '$name | Score: $score | Grade: $grade';
}
