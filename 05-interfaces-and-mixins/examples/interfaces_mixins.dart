// ─────────────────────────────────────────────────────────────────────────
// EXAMPLES — Interfaces and Mixins
// Run: dart run interfaces_mixins.dart
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  // ── 1. Interfaces ─────────────────────────────────────────────────────
  print('=== Interfaces ===');
  List<Describable> items = [
    Product('Laptop', 999.99),
    UserAccount('alice', 'alice@example.com'),
  ];

  for (var item in items) {
    item.describe(); // works for both — both implement Describable
  }

  // ── 2. Mixins ─────────────────────────────────────────────────────────
  print('\n=== Mixins ===');
  var duck     = Duck('Donald');
  var airplane = Airplane('Boeing 747');

  duck.fly();   // from Flyable mixin
  duck.swim();  // from Swimmable mixin
  duck.quack(); // Duck's own method

  airplane.fly(); // Airplane also has fly() from same mixin
  // airplane.swim(); // ERROR — Airplane doesn't have Swimmable

  // ── 3. Loggable mixin applied to different classes ────────────────────
  print('\n=== Loggable Mixin ===');
  var account = BankAccountLogged('Alice', 1000.0);
  account.deposit(500.0);
  account.printLog();

  // ── 4. User input selects implementation ──────────────────────────────
  print('\n=== Role-based Permissions ===');
  stdout.write('Enter your role (admin/viewer): ');
  String role = (stdin.readLineSync() ?? '').toLowerCase();

  Permissions perms = role == 'admin' ? AdminPermissions() : ViewerPermissions();
  perms.read();
  perms.write();
  perms.delete();
}

// ── Interfaces ───────────────────────────────────────────────────────────

abstract class Describable {
  void describe();
}

class Product implements Describable {
  String name;
  double price;
  Product(this.name, this.price);

  @override
  void describe() => print('Product: $name at \$${price.toStringAsFixed(2)}');
}

class UserAccount implements Describable {
  String username;
  String email;
  UserAccount(this.username, this.email);

  @override
  void describe() => print('User: $username ($email)');
}

abstract class Permissions {
  void read();
  void write();
  void delete();
}

class AdminPermissions implements Permissions {
  @override void read()   => print('Admin: reading data');
  @override void write()  => print('Admin: writing data');
  @override void delete() => print('Admin: deleting data');
}

class ViewerPermissions implements Permissions {
  @override void read()   => print('Viewer: reading data');
  @override void write()  => print('Viewer: DENIED — no write access');
  @override void delete() => print('Viewer: DENIED — no delete access');
}

// ── Mixins ───────────────────────────────────────────────────────────────

mixin Flyable {
  void fly() => print('$runtimeType takes flight!');
}

mixin Swimmable {
  void swim() => print('$runtimeType glides through water!');
}

mixin Loggable {
  final List<String> _log = [];

  void log(String message) {
    _log.add('[${DateTime.now().toIso8601String()}] $message');
  }

  void printLog() {
    print('--- Log ---');
    for (var entry in _log) { print(entry); }
  }
}

class Animal {
  String name;
  Animal(this.name);
}

class Duck extends Animal with Flyable, Swimmable {
  Duck(String name) : super(name);
  void quack() => print('$name: Quack!');
}

class Airplane with Flyable {
  String model;
  Airplane(this.model);
}

class BankAccountLogged with Loggable {
  String owner;
  double _balance;
  BankAccountLogged(this.owner, this._balance);

  void deposit(double amount) {
    _balance += amount;
    log('Deposit: \$${amount.toStringAsFixed(2)} | Balance: \$${_balance.toStringAsFixed(2)}');
  }
}
