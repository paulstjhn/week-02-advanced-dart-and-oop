// ─────────────────────────────────────────────────────────────────────────
// ASSIGNMENT 3 — Simple Inventory System
// Your name:
// Date:
//
// SUGGESTED BUILD ORDER:
//   1. Implement the Product abstract class and its subclasses
//   2. Implement the Loggable mixin
//   3. Implement the Inventory class
//   4. Build the menu loop in main()
//   Test each step before moving to the next.
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  var inventory = Inventory();

  // Seed with a couple of products so you have something to test with
  // TODO: Uncomment once your classes are ready
  // inventory.addProduct(ElectronicsProduct('E001', 'Laptop', 450000, 10, 24));
  // inventory.addProduct(FoodProduct('F001', 'Rice (5kg)', 8500, 50, '2025-12-31'));

  // ── Menu loop ──────────────────────────────────────────────────────────
  while (true) {
    printMenu();

    stdout.write('Choice: ');
    String? input = stdin.readLineSync();

    // TODO: Parse input safely and call the right method
    //       Use try/catch to handle invalid menu input

    int choice;
    try {
      choice = int.parse(input ?? '');
    } on FormatException {
      print('Please enter a number between 1 and 8');
      continue; // go back to the top of the loop
    }

    switch (choice) {
      case 1:
        // TODO: Read product details and add
        break;
      case 2:
        // TODO: Read ID and remove
        break;
      case 3:
        // TODO: Read ID and restock amount
        break;
      case 4:
        // TODO: Read ID and find
        break;
      case 5:
        inventory.printAll();
        break;
      case 6:
        inventory.printSummary();
        break;
      case 7:
        inventory.printLogs();
        break;
      case 8:
        print('Goodbye!');
        return;
      default:
        print('Invalid choice — enter 1 to 8');
    }
  }
}

void printMenu() {
  print('\n=== INVENTORY SYSTEM ==');
  print('1. Add product');
  print('2. Remove product');
  print('3. Restock product');
  print('4. Find product');
  print('5. View all products');
  print('6. View summary');
  print('7. View activity log');
  print('8. Exit');
}

// ── TODO: Implement all classes below ─────────────────────────────────────

mixin Loggable {
  // TODO: private _logs list
  // TODO: void log(String message)
  // TODO: void printLogs()
  void printLogs() {}
}

abstract class Product {
  // TODO: private fields _id, _name, _price, _quantity
  // TODO: constructor
  // TODO: getters
  // TODO: setters with validation for _price and _quantity
  // TODO: abstract String category()
  // TODO: double totalValue()
  // TODO: @override String toString()
}

class ElectronicsProduct extends Product {
  // TODO: warrantyMonths field
  // TODO: constructor calling super()
  // TODO: @override String category()
  // TODO: @override String toString() — include warranty info
}

class FoodProduct extends Product {
  // TODO: expiryDate field
  // TODO: constructor calling super()
  // TODO: @override String category()
  // TODO: @override String toString() — include expiry info
}

class Inventory with Loggable {
  final List<Product> _products = [];

  // TODO: void addProduct(Product p)
  // TODO: void removeProduct(String id)
  // TODO: void restockProduct(String id, int quantity)
  // TODO: Product? findById(String id)
  // TODO: void printAll()
  void printAll() {}
  // TODO: void printSummary()
  void printSummary() {}
}
