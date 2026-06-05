# Glossary — Week 3

Reference this whenever you encounter an unfamiliar term.

| Term | Simple Definition | Code Example |
|------|------------------|-------------|
| **Function** | A named, reusable block of code that does one job | `void greet() { print('Hi'); }` |
| **Parameter** | A variable a function receives as input | `void greet(String name) { }` |
| **Argument** | The actual value passed to a function | `greet('Alice')` |
| **Return value** | The output a function sends back | `int add(int a, int b) => a + b;` |
| **Class** | A blueprint for creating objects | `class Car { }` |
| **Object** | A real instance built from a class | `var myCar = Car();` |
| **Constructor** | The function that creates an object | `Car(this.color);` |
| **Field** | A variable that belongs to a class | `String color;` |
| **Method** | A function that belongs to a class | `void drive() { }` |
| **Encapsulation** | Hiding internal details behind a controlled interface | `String _name;` (private) |
| **Getter** | A method that reads a private field | `String get name => _name;` |
| **Setter** | A method that writes to a private field with validation | `set name(String v) { _name = v; }` |
| **Inheritance** | One class taking on the fields/methods of another | `class Dog extends Animal { }` |
| **Subclass** | The class that inherits (the child) | `Dog` in the example above |
| **Superclass** | The class being inherited from (the parent) | `Animal` in the example above |
| **Override** | Replacing a parent method with a new version | `@override void speak() { }` |
| **Polymorphism** | Different classes responding to the same method differently | `animal.speak()` — Dog barks, Cat meows |
| **Abstract class** | A class that cannot be instantiated directly | `abstract class Shape { }` |
| **Interface** | A contract a class must fulfil | `class Circle implements Shape { }` |
| **Mixin** | A way to share behaviour across unrelated classes | `class Flyable with Wings { }` |
| **Exception** | An error that occurs at runtime | `throw Exception('Invalid input');` |
| **try/catch** | A block that handles errors gracefully | `try { } catch (e) { }` |
| **finally** | A block that always runs after try/catch | `finally { closeFile(); }` |
| **stdin** | Standard input — reads from the console | `stdin.readLineSync()` |
| **stdout** | Standard output — prints to the console | `stdout.write('Enter: ')` |
