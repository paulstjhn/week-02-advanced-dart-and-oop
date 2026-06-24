// ─────────────────────────────────────────────────────────────────────────
// SOLUTIONS — Interfaces and Mixins
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  print('── Exercise 1 ──────────────────────────');
  exercise1();
  print('\n── Exercise 2 ──────────────────────────');
  exercise2();
}

abstract class Printable { void printSummary(); }

class Invoice implements Printable {
  String invoiceNumber, clientName;
  double amount;
  Invoice(this.invoiceNumber, this.clientName, this.amount);
  @override void printSummary() =>
    print('Invoice #$invoiceNumber | Client: $clientName | Amount: \$${amount.toStringAsFixed(2)}');
}

class Student implements Printable {
  String name, grade, course;
  Student(this.name, this.grade, this.course);
  @override void printSummary() =>
    print('Student: $name | Course: $course | Grade: $grade');
}

class Vehicle implements Printable {
  String brand, model;
  int year;
  Vehicle(this.brand, this.model, this.year);
  @override void printSummary() =>
    print('Vehicle: $year $brand $model');
}

void exercise1() {
  List<Printable> items = [
    Invoice('INV-001', 'Alice Corp', 1500.00),
    Student('Bob', 'A', 'Dart Programming'),
    Vehicle('Toyota', 'Camry', 2022),
  ];
  for (var item in items) item.printSummary();
}

mixin Loggable {
  final List<String> _logs = [];
  void log(String msg) => _logs.add(msg);
  void printLogs() { print('--- Logs ---'); for (var l in _logs) print(l); }
}

mixin Serializable {
  String serialize();
}

class Transaction with Loggable, Serializable {
  String id, type;
  double amount;
  Transaction(this.id, this.amount, this.type);

  @override
  String serialize() => '$id,$amount,$type';
}

void exercise2() {
  stdout.write('Transaction ID: ');   String id   = stdin.readLineSync() ?? 'T001';
  stdout.write('Amount: ');           double amt  = double.parse(stdin.readLineSync() ?? '0');
  stdout.write('Type (deposit/withdrawal): '); String type = stdin.readLineSync() ?? 'deposit';

  var t = Transaction(id, amt, type);
  t.log('Transaction created: $id');
  t.log('Amount: \$${amt.toStringAsFixed(2)}');
  t.printLogs();
  print('Serialized: ${t.serialize()}');
}
