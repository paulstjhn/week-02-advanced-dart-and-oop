// ─────────────────────────────────────────────────────────────────────────
// SOLUTIONS — Inheritance and Polymorphism
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  print('── Exercise 1 ──────────────────────────');
  exercise1();
  print('
── Exercise 2 ──────────────────────────');
  exercise2();
}

// ══════════════════════════════════════════════════════════════════
// Exercise 1 — Vehicle Hierarchy  🟢
// ══════════════════════════════════════════════════════════════════

class Vehicle {
  String brand;
  int    speed;
  Vehicle(this.brand, this.speed);

  void move() => print('$brand moves at $speed km/h');
}

class Car   extends Vehicle { Car(String b, int s)   : super(b, s); @override void move() => print('$brand drives on road at $speed km/h'); }
class Boat  extends Vehicle { Boat(String b, int s)  : super(b, s); @override void move() => print('$brand sails on water at $speed km/h'); }
class Plane extends Vehicle { Plane(String b, int s) : super(b, s); @override void move() => print('$brand flies in the sky at $speed km/h'); }

void exercise1() {
  stdout.write('Vehicle type (car/boat/plane): ');
  String type = (stdin.readLineSync() ?? '').toLowerCase();

  stdout.write('Brand: '); String brand = stdin.readLineSync() ?? 'Generic';
  stdout.write('Speed: '); int speed    = int.parse(stdin.readLineSync() ?? '0');

  // Polymorphism — store as Vehicle regardless of subclass
  Vehicle v;
  switch (type) {
    case 'car':   v = Car(brand, speed);   break;
    case 'boat':  v = Boat(brand, speed);  break;
    case 'plane': v = Plane(brand, speed); break;
    default:      v = Vehicle(brand, speed);
  }

  v.move(); // correct version called automatically
}

// ══════════════════════════════════════════════════════════════════
// Exercise 2 — Employee Payroll  🟡
// ══════════════════════════════════════════════════════════════════

abstract class Employee {
  String name;
  double hoursWorked;

  Employee(this.name, this.hoursWorked);

  // Subclasses MUST provide their own salary calculation
  double calculateSalary();

  void printPayslip() {
    print('────────────────────────────────');
    print('Name:   $name');
    print('Type:   ${runtimeType}');
    print('Hours:  $hoursWorked');
    print('Salary: \$${calculateSalary().toStringAsFixed(2)}');
    print('────────────────────────────────');
  }
}

class FullTimeEmployee extends Employee {
  FullTimeEmployee(String name, double hours) : super(name, hours);

  @override
  double calculateSalary() => 50000; // fixed monthly salary
}

class PartTimeEmployee extends Employee {
  PartTimeEmployee(String name, double hours) : super(name, hours);

  @override
  double calculateSalary() => hoursWorked * 1500;
}

class Contractor extends Employee {
  Contractor(String name, double hours) : super(name, hours);

  @override
  double calculateSalary() {
    // Contractors are capped at 160 billable hours
    double billable = hoursWorked > 160 ? 160 : hoursWorked;
    return billable * 3000;
  }
}

void exercise2() {
  stdout.write('Employee type (fulltime/parttime/contractor): ');
  String type = (stdin.readLineSync() ?? '').toLowerCase();

  stdout.write('Name: ');
  String name = stdin.readLineSync() ?? 'Employee';

  stdout.write('Hours worked: ');
  double hours = double.parse(stdin.readLineSync() ?? '0');

  Employee emp;
  switch (type) {
    case 'fulltime':   emp = FullTimeEmployee(name, hours); break;
    case 'parttime':   emp = PartTimeEmployee(name, hours); break;
    case 'contractor': emp = Contractor(name, hours);       break;
    default: print('Unknown type'); return;
  }

  emp.printPayslip(); // same call regardless of subclass
}
