# 04 — Inheritance and Polymorphism

## What You'll Learn
- What inheritance is and when to use it
- How to extend a class with `extends`
- Overriding parent methods with `@override`
- Abstract classes — blueprints that cannot be instantiated
- Polymorphism — treating different objects the same way
- Using user input to decide which subclass to create

---

## Simple Explanation

### Inheritance

A dog IS an animal. A cat IS an animal. Both share animal traits
(they breathe, they move, they eat), but they also have their own
unique behaviours (a dog barks, a cat meows).

Instead of writing "breathe, move, eat" twice, you write it once
in an `Animal` class and let `Dog` and `Cat` **inherit** it.

```
Animal          (parent / superclass)
  ├── Dog       (child / subclass) — inherits Animal, adds bark()
  └── Cat       (child / subclass) — inherits Animal, adds meow()
```

### Polymorphism

"Poly" = many. "Morph" = form. **Polymorphism** means one thing
can take many forms.

You can treat a `Dog` and a `Cat` both as `Animal` objects — and
call `speak()` on each. The right version runs automatically.

---

## Technical Elaboration

### `extends`

```dart
class Animal {
  String name;
  Animal(this.name);

  void speak() {
    print('$name makes a sound');
  }

  void breathe() {
    print('$name breathes');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name); // super() calls the parent constructor

  @override
  void speak() {
    print('$name barks: Woof!'); // replaces Animal's speak()
  }

  void fetch() {
    print('$name fetches the ball!');
  }
}
```

### `@override`

The `@override` annotation tells Dart (and the reader) that you
are intentionally replacing a parent method. Without it the code
still works, but with it you get a warning if you misspell the
method name — a useful safety net.

### Abstract Classes

An abstract class cannot be instantiated directly. It defines a
contract that all subclasses must fulfil:

```dart
abstract class Shape {
  // No body — subclasses MUST provide their own implementation
  double area();
  double perimeter();

  void describe() {
    // Shared method all shapes can use
    print('Area: ${area().toStringAsFixed(2)}, Perimeter: ${perimeter().toStringAsFixed(2)}');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area()      => 3.14159 * radius * radius;

  @override
  double perimeter() => 2 * 3.14159 * radius;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area()      => width * height;

  @override
  double perimeter() => 2 * (width + height);
}
```

### Polymorphism in Action

```dart
// Both Dog and Cat are stored as Animal — polymorphism
List<Animal> animals = [Dog('Rex'), Cat('Whiskers'), Dog('Max')];

for (Animal a in animals) {
  a.speak(); // the right version runs for each type automatically
}
// Rex barks: Woof!
// Whiskers meows: Meow!
// Max barks: Woof!
```

### User Input to Select Subclass

```dart
stdout.write('Enter shape (circle/rectangle): ');
String choice = stdin.readLineSync() ?? '';

Shape shape;
if (choice == 'circle') {
  stdout.write('Enter radius: ');
  double r = double.parse(stdin.readLineSync() ?? '0');
  shape = Circle(r);
} else {
  stdout.write('Enter width: ');  double w = double.parse(stdin.readLineSync() ?? '0');
  stdout.write('Enter height: '); double h = double.parse(stdin.readLineSync() ?? '0');
  shape = Rectangle(w, h);
}

shape.describe(); // polymorphism — correct version called automatically
```

---

## Code Examples

See: [`examples/inheritance.dart`](./examples/inheritance.dart)

---

## Common Mistakes

**❌ Forgetting `super()` in the subclass constructor:**
```dart
class Dog extends Animal {
  Dog(String name); // ERROR — parent constructor not called
}
// ✅
class Dog extends Animal {
  Dog(String name) : super(name);
}
```

**❌ Instantiating an abstract class:**
```dart
var shape = Shape(); // ERROR — abstract classes cannot be created
// ✅ Create a concrete subclass instead:
var shape = Circle(5.0);
```

---

## 🧠 Mental Model

```
Abstract Shape (contract — cannot create directly)
│
├── Circle      ← its own area/perimeter formula
├── Rectangle   ← its own area/perimeter formula
└── Triangle    ← its own area/perimeter formula

List<Shape> shapes = [Circle(...), Rectangle(...), Triangle(...)];
for (Shape s in shapes) {
  s.area(); // ← Dart picks the right version automatically
}
```

The list doesn't know or care what specific shape it holds —
it just knows each one IS a Shape and can calculate its area.
That's polymorphism.

---

## 🔗 Why This Matters in Flutter

`StatelessWidget` and `StatefulWidget` are abstract classes.
Every widget you write **extends** one of them and **overrides**
the `build()` method. You've been using inheritance from day one
in Flutter — now you understand what's actually happening.

---

## 💡 Try It Yourself

1. Create an `Employee` parent class with a `calculateSalary()` method.
   Create `FullTime` and `PartTime` subclasses that override it differently.
2. Read which employee type from the user, create the right subclass,
   and call `calculateSalary()` — the correct version runs automatically.
3. Store both in a `List<Employee>` and print all salaries with a loop.

---

## Key Takeaways

- `extends` creates a parent-child relationship between classes
- `super()` calls the parent constructor from the subclass
- `@override` replaces a parent method with a new version
- Abstract classes define contracts — they cannot be instantiated directly
- Polymorphism means treating different subclass objects uniformly
- User input can decide which subclass to create at runtime
