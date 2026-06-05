# 05 — Interfaces and Mixins

## What You'll Learn
- What an interface is and how it differs from inheritance
- Using `implements` in Dart
- What a mixin is and when to use it
- Using `with` to apply mixins
- Why these matter especially in Flutter

---

## Simple Explanation

### Interfaces — A Contract

Inheritance (`extends`) says: "I AM a type of this thing."
A `Dog` IS an `Animal`.

An interface (`implements`) says: "I PROMISE to do these things."
A `BirdOfPrey` PROMISES to implement `Flyable` and `Huntable`.

An interface is a **contract** — it defines what a class must
be able to do, without dictating how.

### Mixins — A Plug-in

A mixin is a **plug-in of shared behaviour** that you can attach
to any class regardless of its inheritance chain.

Think of it as a USB dongle. A laptop, a phone, and a smartwatch
all accept USB — they share that capability without being related to
each other. A mixin is that shared capability.

```
class SwimmingRobot  with Swimmable, Rechargeable { }
class SwimmingAnimal with Swimmable { }
// Both can swim — but they're completely unrelated classes
```

---

## Technical Elaboration

### `implements`

In Dart, every class is also implicitly an interface. When you
`implement` a class, you agree to provide ALL of its methods:

```dart
abstract class Printable {
  void printDetails();
}

abstract class Saveable {
  void save();
}

// Employee implements BOTH contracts
class Employee implements Printable, Saveable {
  String name;
  Employee(this.name);

  @override
  void printDetails() => print('Employee: $name');

  @override
  void save() => print('Saving $name to database...');
}
```

### `mixin`

A mixin provides reusable methods that any class can adopt:

```dart
mixin Flyable {
  void fly() => print('$runtimeType is flying!');
  double get maxAltitude => 10000;
}

mixin Swimmable {
  void swim() => print('$runtimeType is swimming!');
}

class Duck extends Animal with Flyable, Swimmable {
  Duck(String name) : super(name);
  // Duck automatically has fly() and swim() from mixins
}

class Airplane with Flyable {
  // Airplane has fly() — no relation to Duck
}
```

### `implements` vs `extends` vs `with`

| Keyword | Relationship | Can add behaviour? | Must implement all methods? |
|---------|-------------|-------------------|-----------------------------|
| `extends` | IS-A | Yes (inherits) | Only abstract ones |
| `implements` | PROMISES-TO | No (must write own) | ALL methods |
| `with` | HAS-THE-ABILITY-TO | Yes (gets mixin methods) | No |

---

## Code Examples

See: [`examples/interfaces_mixins.dart`](./examples/interfaces_mixins.dart)

---

## Common Mistakes

**❌ Confusing `implements` with `extends`:**
```dart
class Dog implements Animal { }
// Now Dog MUST implement EVERY method of Animal from scratch.
// You lose all of Animal's built-in behaviour.
// This is usually not what you want — use extends instead.
```

**✅ Use `implements` for contracts, `extends` for shared behaviour.**

---

## 🧠 Mental Model

```
extends  → "I am built on top of this. I inherit everything."
           Dog IS-A Animal — gets Animal's body for free

implements → "I sign this contract. I write everything myself."
             Employee PROMISES to implement Printable and Saveable

with     → "I plug this in. I get these extra abilities."
           Duck HAS-THE-ABILITY-TO fly AND swim
```

---

## 🔗 Why This Matters in Flutter

Flutter uses mixins everywhere:
- `TickerProviderStateMixin` — adds animation timing to your State
- `AutomaticKeepAliveClientMixin` — keeps a widget alive in a PageView

When you write:
```dart
class _MyState extends State<MyWidget> with TickerProviderStateMixin {
```
You are using `extends` AND `with` together. Now you understand what
both of those mean.

---

## 💡 Try It Yourself

1. Create a `Describable` interface with a `describe()` method.
   Implement it in a `Product` and a `User` class.
2. Create a `Loggable` mixin with a `log(String message)` method.
   Apply it to three unrelated classes and call `log()` on each.
3. Read a user's role from the console ('admin' / 'viewer').
   Create different implementations of a `Permissions` interface
   based on the role.

---

## Key Takeaways

- `implements` defines a contract — all methods must be implemented
- `with` applies a mixin — you get the mixin's behaviour for free
- A class can implement multiple interfaces
- A class can use multiple mixins
- Mixins are perfect for shared behaviour across unrelated classes
- Flutter uses mixins constantly — understanding them unlocks Flutter internals
