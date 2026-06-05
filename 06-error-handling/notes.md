# 06 — Error Handling

## What You'll Learn
- What exceptions are and why they happen
- Using `try`, `catch`, `finally`
- Throwing custom exceptions
- Handling specific exception types
- Validating and re-prompting user input safely

---

## Simple Explanation

Imagine you're a bank teller. A customer hands you a cheque.
You don't assume everything is fine — you **check**:
- Is the cheque signed?
- Does the account have enough funds?
- Is the amount written correctly?

If something is wrong, you don't crash the whole bank. You politely
explain the problem and ask the customer to try again.

That's error handling in programming. Things go wrong — especially
when user input is involved. Your job is to catch the problem,
handle it gracefully, and keep the program running.

**Without error handling:**
```dart
// If user types "abc" instead of a number, this CRASHES the program
int age = int.parse(stdin.readLineSync() ?? '');
```

**With error handling:**
```dart
try {
  int age = int.parse(stdin.readLineSync() ?? '');
  print('Age: $age');
} catch (e) {
  print('Please enter a valid number');
  // program keeps running
}
```

---

## Technical Elaboration

### `try` / `catch` / `finally`

```dart
try {
  // Code that might fail goes here
  int result = int.parse('abc'); // throws FormatException
} catch (e) {
  // e is the exception object — contains info about what went wrong
  print('Something went wrong: $e');
} finally {
  // This ALWAYS runs — whether or not an exception occurred
  // Use it to clean up resources (close files, connections, etc.)
  print('Done — always runs');
}
```

### Catching Specific Exception Types

```dart
try {
  int result = 10 ~/ 0;           // throws IntegerDivisionByZeroException
  int number = int.parse('xyz');   // throws FormatException
} on IntegerDivisionByZeroException {
  print('Cannot divide by zero');
} on FormatException catch (e) {
  print('Invalid number format: ${e.message}');
} catch (e) {
  // Catches anything else not handled above
  print('Unexpected error: $e');
}
```

### Throwing Exceptions

```dart
void withdraw(double amount, double balance) {
  if (amount <= 0) {
    throw ArgumentError('Amount must be greater than zero');
  }
  if (amount > balance) {
    throw Exception('Insufficient funds');
  }
  // proceed with withdrawal
}
```

### Custom Exceptions

```dart
class InsufficientFundsException implements Exception {
  final double amount;
  final double balance;

  InsufficientFundsException(this.amount, this.balance);

  @override
  String toString() =>
      'Cannot withdraw \$${amount.toStringAsFixed(2)} — balance is only \$${balance.toStringAsFixed(2)}';
}

// Throwing it
throw InsufficientFundsException(500.0, 200.0);

// Catching it specifically
try {
  withdraw(500.0, 200.0);
} on InsufficientFundsException catch (e) {
  print(e); // Uses custom toString()
}
```

### Safe Input Loop with Re-prompting

```dart
int readAge() {
  while (true) {
    stdout.write('Enter age (0-120): ');
    try {
      int age = int.parse(stdin.readLineSync() ?? '');
      if (age < 0 || age > 120) throw RangeError('Age out of range');
      return age; // valid — exit the loop
    } on FormatException {
      print('  Please enter a whole number');
    } on RangeError {
      print('  Age must be between 0 and 120');
    }
    // loop continues — prompts again
  }
}
```

This pattern — `while(true)` + `try/catch` + `return` on success — is
the cleanest way to keep asking until you get valid input.

---

## Code Examples

See: [`examples/error_handling.dart`](./examples/error_handling.dart)

---

## Common Mistakes

**❌ Catching everything silently:**
```dart
try {
  riskyOperation();
} catch (e) {
  // said nothing — swallowed the error
}
```
**✅ Always at minimum print what went wrong:**
```dart
catch (e) {
  print('Error: $e');
}
```

---

**❌ Throwing Strings instead of Exception objects:**
```dart
throw 'Something went wrong'; // works but is bad practice
```
**✅ Throw proper Exception types:**
```dart
throw Exception('Something went wrong');
throw ArgumentError('Invalid input');
```

---

**❌ Putting too much in `try`:**
```dart
try {
  // 50 lines of code
}
```
**✅ Only wrap the specific lines that can fail:**
```dart
int value;
try {
  value = int.parse(input); // only this line can throw
} on FormatException {
  value = 0;
}
print('Value: $value'); // outside try — doesn't need it
```

---

## 🧠 Mental Model

Think of `try/catch` as a **safety net under a tightrope walker**.

The walker (your code) attempts the risky manoeuvre (the `try` block).
If they fall (an exception is thrown), the net catches them (the `catch`
block) — the show doesn't stop, the audience doesn't panic.

`finally` is the stage crew — they clean up after every performance,
whether the walk went perfectly or ended in the net.

---

## 🔗 Why This Matters in Flutter

Every network request in Flutter can fail. Every database read can fail.
Every user input needs validation. Without error handling your app
crashes instead of showing a helpful message.

Flutter's `FutureBuilder` and `StreamBuilder` widgets have explicit
`error` states precisely because errors are expected — not exceptions.

---

## 💡 Try It Yourself

1. Write a function that reads a number from the user and keeps
   asking until a valid integer is entered.
2. Create a custom `ValidationException` class. Throw it when
   a name field is left empty.
3. Add a `finally` block to a file-reading simulation and observe
   when it runs — both with and without an error.

---

## Key Takeaways

- Exceptions are runtime errors — programs that don't handle them crash
- `try` wraps risky code; `catch` handles failures; `finally` always runs
- Use `on ExceptionType` to handle specific exceptions differently
- `throw` manually raises an exception with a meaningful message
- Custom exceptions give your errors clear, descriptive types
- The `while(true)` + `return on success` pattern is the cleanest input loop
- Only wrap the specific lines that can throw — not entire function bodies
