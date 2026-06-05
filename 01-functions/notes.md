# 01 — Functions in Dart

## What You'll Learn
- What a function is and why we use them
- How to define, call, and return values from functions
- Required and optional parameters
- Named parameters
- Arrow functions (shorthand syntax)
- Reading user input and passing it to functions

---

## 📥 Reading User Input in Dart

Since this is your first time using console input, here is the complete
reference. This box applies to every topic this week — come back to it
whenever you need a reminder.

```dart
import 'dart:io'; // ALWAYS needed for console input

stdout.write('Enter value: ');     // prints without a newline
String? raw = stdin.readLineSync(); // reads one line — always String?
String value = raw ?? '';           // handle null with a fallback
int number   = int.parse(value);    // convert text to int if needed
double price = double.parse(value); // convert text to double if needed
```

Key rules:
- `stdin.readLineSync()` ALWAYS returns `String?` — never assume it has a value
- All input arrives as text — convert it before using it as a number
- `int.parse('abc')` throws an error — Week 6 covers handling this safely

---

## Simple Explanation

Imagine you're a chef. Every time someone orders scrambled eggs, you
don't reinvent the process — you follow the same recipe.

A **function** is that recipe. You write the steps once, give it a name,
and call it by name whenever you need it.

Without functions, you'd copy-paste the same code everywhere. With
functions, you write it once and reuse it anywhere.

```
WITHOUT functions          WITH functions
──────────────────         ──────────────────────
print('Hello Alice');      greet('Alice');
print('Hello Bob');        greet('Bob');
print('Hello Charlie');    greet('Charlie');
(copy-paste × 3)           (written once, called 3 times)
```

---

## Technical Elaboration

### Defining and Calling a Function

```dart
// Definition — the recipe
void greet(String name) {
  print('Hello, $name!');
}

// Call — using the recipe
greet('Alice');   // Hello, Alice!
greet('Bob');     // Hello, Bob!
```

Parts of a function:
```
void      greet   (String name)  { print('Hello, $name!'); }
 ↑          ↑          ↑                    ↑
return    name     parameter             body
type              (input)
```

### Return Values

`void` means the function returns nothing. Use a type instead when
the function should produce a value:

```dart
// Returns an int
int add(int a, int b) {
  return a + b;
}

int result = add(5, 3); // result = 8
```

### Optional Parameters

Parameters in `[]` are optional — they have a default value if not provided:

```dart
void introduce(String name, [String role = 'Member']) {
  print('$name — $role');
}

introduce('Alice');           // Alice — Member
introduce('Bob', 'Admin');    // Bob — Admin
```

### Named Parameters

Parameters in `{}` must be called by name — makes code more readable:

```dart
void createProfile({required String name, int age = 0}) {
  print('Name: $name, Age: $age');
}

createProfile(name: 'Alice', age: 22); // clear what each value means
createProfile(name: 'Bob');            // age defaults to 0
```

### Arrow Functions

When a function body is a single expression, use `=>` to shorten it:

```dart
// Full version
int square(int n) {
  return n * n;
}

// Arrow version — identical result
int square(int n) => n * n;
```

---

## Code Examples

See: [`examples/functions.dart`](./examples/functions.dart)

---

## Common Mistakes

**❌ Forgetting to return a value:**
```dart
int add(int a, int b) {
  int result = a + b;
  // forgot: return result;
}
```
**✅ Always return when the return type is not void:**
```dart
int add(int a, int b) {
  return a + b;
}
```

---

**❌ Calling a function before defining it — actually fine in Dart!**
Unlike some languages, Dart allows calling a function defined later
in the same file. But keep definitions organised for readability.

---

**❌ Confusing parameters and arguments:**
```dart
void greet(String name) { }  // name is the PARAMETER (in the definition)
greet('Alice');               // 'Alice' is the ARGUMENT (in the call)
```
These words are often used interchangeably, but the distinction matters
when reading error messages.

---

## 🧠 Mental Model

Think of a function as a **vending machine**.

- You press a button (call the function)
- You might insert coins (pass arguments)
- It does its job internally
- It gives you something back (return value) — or not (`void`)

You don't need to know how the machine works inside. You just need to
know what button to press and what comes out.

---

## 🔗 Why This Matters in Flutter

Every Flutter widget has a `build()` function. Every button has an
`onPressed` function. Every network request uses an `async` function.

Flutter code IS function calls — you'll write and read them constantly.
Understanding functions deeply is not optional in Flutter.

---

## 💡 Try It Yourself

1. Write a function that takes two numbers and returns the larger one.
2. Write a function with a named parameter `greeting` that defaults to `'Hello'`.
3. Convert your Week 2 Receipt Generator logic into functions — one function
   per responsibility (calculate subtotal, calculate tax, print receipt).
4. Read a name from the console and pass it to a `greet()` function.

---

## Key Takeaways

- Functions are reusable named blocks of code
- Parameters are inputs; return values are outputs
- `void` means no return value
- `[]` makes parameters optional; `{}` makes them named
- `=>` is shorthand for a single-expression function body
- Always convert `stdin.readLineSync()` output before using as a number
