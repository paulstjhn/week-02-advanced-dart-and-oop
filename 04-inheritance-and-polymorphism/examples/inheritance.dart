// ─────────────────────────────────────────────────────────────────────────
// EXAMPLES — Inheritance and Polymorphism
// Run: dart run inheritance.dart
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';
import 'dart:math';

void main() {
  // ── 1. Basic Inheritance ───────────────────────────────────────────────
  print('=== Animal Inheritance ===');
  List<Animal> animals = [Dog('Rex'), Cat('Whiskers'), Dog('Max')];

  for (Animal a in animals) {
    a.speak();   // polymorphism — correct version for each type
    a.breathe(); // inherited from Animal — same for all
  }

  // ── 2. Abstract class + polymorphism ──────────────────────────────────
  print('
=== Shape Calculator ===');
  List<Shape> shapes = [Circle(5), Rectangle(4, 6), Triangle(3, 4, 5)];

  for (Shape s in shapes) {
    s.describe(); // each shape uses its own area/perimeter formula
  }

  // ── 3. User input selects subclass ────────────────────────────────────
  print('
=== Choose Your Shape ===');
  stdout.write('Enter shape (circle/rectangle/triangle): ');
  String choice = (stdin.readLineSync() ?? '').toLowerCase();

  Shape? userShape;

  if (choice == 'circle') {
    stdout.write('Radius: ');
    double r = double.parse(stdin.readLineSync() ?? '1');
    userShape = Circle(r);
  } else if (choice == 'rectangle') {
    stdout.write('Width: ');  double w = double.parse(stdin.readLineSync() ?? '1');
    stdout.write('Height: '); double h = double.parse(stdin.readLineSync() ?? '1');
    userShape = Rectangle(w, h);
  } else if (choice == 'triangle') {
    stdout.write('Side a: '); double a = double.parse(stdin.readLineSync() ?? '3');
    stdout.write('Side b: '); double b = double.parse(stdin.readLineSync() ?? '4');
    stdout.write('Side c: '); double c = double.parse(stdin.readLineSync() ?? '5');
    userShape = Triangle(a, b, c);
  } else {
    print('Unknown shape');
  }

  userShape?.describe(); // ?. safely handles null if choice was invalid
}

// ── Animal hierarchy ─────────────────────────────────────────────────────

class Animal {
  String name;
  Animal(this.name);

  void speak() => print('$name makes a sound');
  void breathe() => print('$name breathes');
}

class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void speak() => print('$name barks: Woof!');
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void speak() => print('$name meows: Meow!');
}

// ── Shape hierarchy (abstract) ───────────────────────────────────────────

abstract class Shape {
  double area();
  double perimeter();

  void describe() {
    print('${runtimeType} | Area: ${area().toStringAsFixed(2)} | Perimeter: ${perimeter().toStringAsFixed(2)}');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override double area()      => pi * radius * radius;
  @override double perimeter() => 2 * pi * radius;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override double area()      => width * height;
  @override double perimeter() => 2 * (width + height);
}

class Triangle extends Shape {
  double a, b, c;
  Triangle(this.a, this.b, this.c);

  @override
  double area() {
    // Heron's formula
    double s = perimeter() / 2;
    return sqrt(s * (s - a) * (s - b) * (s - c));
  }

  @override double perimeter() => a + b + c;
}
