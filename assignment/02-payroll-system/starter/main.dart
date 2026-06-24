// ─────────────────────────────────────────────────────────────────────────
// ASSIGNMENT 2 — Employee Payroll System
// Your name:
// Date:
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  List<Employee> employees = [];

  // ── Step 1: Read number of employees ──────────────────────────────────
  stdout.write('How many employees? ');
  int count = int.parse(stdin.readLineSync() ?? '3');

  // ── Step 2: Read each employee's details ──────────────────────────────
  for (int i = 1; i <= count; i++) {
    print('\n--- Employee $i ---');

    stdout.write('Type (fulltime/parttime/contractor): ');
    String type = (stdin.readLineSync() ?? '').toLowerCase();

    stdout.write('Name: ');
    String name = stdin.readLineSync() ?? 'Employee $i';

    stdout.write('ID: ');
    String id = stdin.readLineSync() ?? 'EMP-00$i';

    // TODO: Wrap hours input in try/catch and re-prompt if invalid
    stdout.write('Hours worked: ');
    double hours = double.parse(stdin.readLineSync() ?? '0');

    // TODO: Create the right subclass based on type and add to list
    // employees.add(...)
  }

  // ── Step 3: Print all payslips ────────────────────────────────────────
  // TODO: Loop through employees and call printPayslip() on each

  // ── Step 4: Print payroll summary ─────────────────────────────────────
  // TODO: Calculate totals, highest, lowest and print summary
}

// ── TODO: Implement the class hierarchy below ──────────────────────────────

abstract class Employee {
  String name;
  String id;
  double hoursWorked;

  Employee(this.name, this.id, this.hoursWorked);

  // TODO: abstract double calculateSalary();
  // TODO: abstract String get employeeType;

  void printPayslip() {
    // TODO: Print formatted payslip
  }
}

// TODO: class FullTimeEmployee extends Employee { }
// TODO: class PartTimeEmployee extends Employee { }
// TODO: class Contractor extends Employee { }
