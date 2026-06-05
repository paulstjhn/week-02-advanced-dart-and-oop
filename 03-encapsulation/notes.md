# 03 — Encapsulation

## What You'll Learn
- What encapsulation is and why it matters
- Private fields using `_` prefix
- Getters and setters
- Validating data before storing it
- Reading user input with validation

---

## Simple Explanation

Imagine a vending machine. You can press buttons and receive items,
but you cannot reach inside and change the prices or steal from the
cash box. The internals are **hidden** — you only interact through
the approved interface.

That's encapsulation. A class hides its internal data and only
allows controlled access through methods.

**Without encapsulation:**
```dart
class BankAccount {
  double balance = 1000.0; // anyone can change this
}

var account = BankAccount();
account.balance = -99999; // ← PROBLEM: no validation!
```

**With encapsulation:**
```dart
class BankAccount {
  double _balance = 1000.0; // private — cannot be accessed directly

  double get balance => _balance; // controlled read access

  void deposit(double amount) {
    if (amount <= 0) { print('Invalid amount'); return; }
    _balance += amount; // only changed through validated methods
  }
}
```

---

## Technical Elaboration

### Private Fields

In Dart, prefix a field name with `_` to make it private to its file:

```dart
class Person {
  String _name; // private — only accessible within this class
  int    _age;

  Person(this._name, this._age);
}
```

### Getters

A getter provides **read access** to a private field:

```dart
class Person {
  String _name;
  Person(this._name);

  // Getter — called like a field, not a method
  String get name => _name;
}

var p = Person('Alice');
print(p.name); // Alice — reads via getter
```

### Setters

A setter provides **write access** with the ability to validate:

```dart
class Person {
  String _name;
  int    _age;
  Person(this._name, this._age);

  // Getter
  int get age => _age;

  // Setter — validates before storing
  set age(int value) {
    if (value < 0 || value > 150) {
      print('Invalid age: $value');
      return;
    }
    _age = value;
  }
}

var p = Person('Alice', 25);
p.age = 30;    // valid — stored
p.age = -5;    // invalid — rejected with message
print(p.age);  // 30
```

### Computed Getters

Getters can also compute and return derived values:

```dart
class Rectangle {
  double _width;
  double _height;
  Rectangle(this._width, this._height);

  // These are calculated, not stored
  double get area      => _width * _height;
  double get perimeter => 2 * (_width + _height);
}
```

---

## Code Examples

See: [`examples/encapsulation.dart`](./examples/encapsulation.dart)

---

## Common Mistakes

**❌ Making a setter with no validation:**
```dart
set name(String value) {
  _name = value; // pointless — just make the field public
}
```
**✅ Only use a setter when you need validation:**
```dart
set name(String value) {
  if (value.isEmpty) { print('Name cannot be empty'); return; }
  _name = value;
}
```

---

## 🧠 Mental Model

Think of a class with encapsulation as a **capsule pill**.

The medicine (data) is sealed inside. You can't touch it directly.
You swallow the whole capsule (use the public interface) and the
body absorbs it correctly (validation runs automatically).

The `_` prefix is Dart's seal on the capsule.

---

## 🔗 Why This Matters in Flutter

Flutter's `State` class uses encapsulation heavily. Your widget's
state variables are private — accessed through controlled methods like
`setState()`. This prevents accidental direct mutation that would
bypass the rebuild cycle and break your UI.

---

## 💡 Try It Yourself

1. Create a `BankAccount` class with a private `_balance`. Add getter,
   and a `deposit` method that rejects negative amounts.
2. Read an age from the user. Try to set it using a setter that
   rejects values outside 0–120.
3. Add a computed getter `String get status` that returns
   `'Minor'` or `'Adult'` based on the age field.

---

## Key Takeaways

- Encapsulation hides internal data and controls how it's accessed
- `_` prefix makes a field/method private in Dart
- Getters provide controlled read access — called like a property
- Setters provide controlled write access with validation
- Computed getters return derived values without storing them
- Only expose what the outside world needs to know
