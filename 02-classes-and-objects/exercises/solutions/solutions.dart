// ─────────────────────────────────────────────────────────────────────────
// SOLUTIONS — Classes and Objects
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  print('── Exercise 1 ──────────────────────────');
  exercise1();
  print('\n── Exercise 2 ──────────────────────────');
  exercise2();
}

// ══════════════════════════════════════════════════════════════════
// Exercise 1  🟢
// ══════════════════════════════════════════════════════════════════

class Product {
  String name;
  double price;
  int    quantity;

  Product(this.name, this.price, this.quantity);

  double totalValue() => price * quantity;

  void restock(int amount) {
    quantity += amount;
    print('Restocked $name by $amount. New quantity: $quantity');
  }

  @override
  String toString() =>
      '$name | Price: \$${price.toStringAsFixed(2)} | Qty: $quantity | Value: \$${totalValue().toStringAsFixed(2)}';
}

void exercise1() {
  stdout.write('Product name: ');
  String name = stdin.readLineSync() ?? 'Item';

  stdout.write('Price: ');
  double price = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Quantity: ');
  int qty = int.parse(stdin.readLineSync() ?? '0');

  var product = Product(name, price, qty);
  print(product);

  stdout.write('Restock by how many? ');
  int restock = int.parse(stdin.readLineSync() ?? '0');

  product.restock(restock);
  print(product);
}

// ══════════════════════════════════════════════════════════════════
// Exercise 2  🟢
// ══════════════════════════════════════════════════════════════════

class Student {
  String name;
  int score1, score2, score3;

  Student(this.name, this.score1, this.score2, this.score3);

  double average() => (score1 + score2 + score3) / 3;

  String grade() {
    double avg = average();
    return avg >= 90 ? 'A' : avg >= 80 ? 'B' : avg >= 70 ? 'C' : 'F';
  }

  @override
  String toString() =>
      '$name | Avg: ${average().toStringAsFixed(1)} | Grade: ${grade()}';
}

void exercise2() {
  List<Student> students = [];

  for (int i = 1; i <= 3; i++) {
    print('--- Student $i ---');
    stdout.write('Name: ');
    String name = stdin.readLineSync() ?? 'Student $i';

    stdout.write('Score 1: '); int s1 = int.parse(stdin.readLineSync() ?? '0');
    stdout.write('Score 2: '); int s2 = int.parse(stdin.readLineSync() ?? '0');
    stdout.write('Score 3: '); int s3 = int.parse(stdin.readLineSync() ?? '0');

    students.add(Student(name, s1, s2, s3));
  }

  print('\n--- All Students ---');
  for (var s in students) print(s);

  // Find the top student using the same max-finding algorithm from Week 2
  Student top = students[0];
  for (var s in students) {
    if (s.average() > top.average()) top = s;
  }
  print('\nTop student: ${top.name} (${top.average().toStringAsFixed(1)})');
}
