# 02 — Classes and Objects

## What You'll Learn
- The difference between a class and an object
- How to define fields, constructors, and methods
- Named constructors
- The `toString()` override
- Creating objects from user input

---

## Simple Explanation

Last week you stored student data like this:

```dart
// ❌ Without classes — messy, does not scale
String student1Name  = 'Alice';
int    student1Score = 88;
String student2Name  = 'Bob';
int    student2Score = 74;
```

Every new student means two more variables. With 30 students
that's 60 variables — impossible to manage.

A **class** is a blueprint that groups related data and behaviour
together. An **object** is a real instance built from that blueprint:

```dart
// ✅ With a class — clean, reusable, scalable
class Student {
  String name;
  int    score;
  Student(this.name, this.score);
}

var student1 = Student('Alice', 88); // one line per student
var student2 = Student('Bob', 74);
var student3 = Student('Charlie', 91);
```

The blueprint exists once. You can build as many objects as you need.

---

## Technical Elaboration

### Defining a Class

```dart
class BankAccount {
  // Fields — the data the object holds
  String owner;
  double balance;

  // Constructor — how to create an object
  // 'this.owner' automatically assigns the parameter to the field
  BankAccount(this.owner, this.balance);

  // Method — behaviour the object can perform
  void deposit(double amount) {
    balance += amount;
    print('Deposited \$${amount.toStringAsFixed(2)}');
  }

  void printBalance() {
    print('$owner: \$${balance.toStringAsFixed(2)}');
  }
}
```

### Creating Objects

```dart
void main() {
  // Create two completely independent objects from the same blueprint
  var alice = BankAccount('Alice', 1000.0);
  var bob   = BankAccount('Bob',   500.0);

  alice.deposit(250.0);  // only alice's balance changes
  alice.printBalance();  // Alice: $1250.00
  bob.printBalance();    // Bob: $500.00
}
```

### Named Constructors

When you need multiple ways to create an object:

```dart
class Temperature {
  double celsius;

  // Default constructor
  Temperature(this.celsius);

  // Named constructor — creates from Fahrenheit
  Temperature.fromFahrenheit(double f) : celsius = (f - 32) * 5 / 9;

  // Named constructor — creates at absolute zero
  Temperature.absoluteZero() : celsius = -273.15;
}

var boiling  = Temperature(100);
var bodyTemp = Temperature.fromFahrenheit(98.6);
var zero     = Temperature.absoluteZero();
```

### Overriding `toString()`

By default, printing an object gives something like `Instance of 'Student'`.
Override `toString()` to make it useful:

```dart
class Student {
  String name;
  int score;
  Student(this.name, this.score);

  @override
  String toString() => 'Student($name, score: $score)';
}

print(Student('Alice', 88)); // Student(Alice, score: 88)
```

---

## Code Examples

See: [`examples/classes.dart`](./examples/classes.dart)

---

## Common Mistakes

**❌ Confusing the class with the object:**
```dart
// BankAccount is the blueprint — you cannot use it directly
BankAccount.deposit(100); // ERROR

// Create an object first, then use it
var account = BankAccount('Alice', 500);
account.deposit(100); // correct
```

**❌ Forgetting to initialise fields:**
```dart
class Car {
  String color; // ERROR in null-safe Dart — must be initialised
}
// ✅ Fix:
class Car {
  String color;
  Car(this.color); // constructor initialises it
}
```

---

## 🧠 Mental Model

```
CLASS (the blueprint)           OBJECT (the real thing)
────────────────────            ────────────────────────
BankAccount                     alice
  owner: String          →        owner: "Alice"
  balance: double                 balance: 1250.0
  deposit()                       deposit()
  printBalance()                  printBalance()

                                bob
                         →        owner: "Bob"
                                  balance: 500.0
```

One blueprint. Many independent objects. Each object has its own
copy of the data — changing Alice's balance never touches Bob's.

---

## 🔗 Why This Matters in Flutter

Every Flutter widget is a class. When you write:
```dart
class MyHomePage extends StatefulWidget { ... }
```
You are creating a class. When Flutter builds your screen, it
creates an **object** from your class blueprint. Understanding this
makes Flutter's widget system click into place.

---

## 💡 Try It Yourself

1. Create a `Car` class with `make`, `model`, and `year` fields.
   Add a `describe()` method and override `toString()`.
2. Read car details from the user and create a `Car` object from them.
3. Add a named constructor `Car.unknown()` that sets all fields to defaults.
4. Create a `List<Car>` with 3 cars and print each one.

---

## Key Takeaways

- A class is a blueprint; an object is a real instance from that blueprint
- Fields store data; methods define behaviour
- `this.fieldName` in a constructor auto-assigns parameters to fields
- Named constructors provide alternative ways to create objects
- Override `toString()` to make objects print meaningfully
- Each object is independent — changing one never affects another
