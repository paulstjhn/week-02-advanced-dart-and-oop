# Exercises — Functions

> Attempt every exercise before checking solutions.
> Solutions: `solutions/solutions.dart`

---

## 🟢 Beginner

### Exercise 1 — Temperature Converter
**Concepts:** Functions, parameters, return values

Write two functions:
- `celsiusToFahrenheit(double c)` — returns the Fahrenheit equivalent
- `fahrenheitToCelsius(double f)` — returns the Celsius equivalent

Formula: `F = (C × 9/5) + 32`

Read a temperature and unit from the user, convert it, and print the result.

```
Enter temperature: 100
Enter unit (C/F): C
100.0°C = 212.0°F
```

---

### Exercise 2 — Simple Calculator
**Concepts:** Functions, named parameters, user input

Write four functions: `add`, `subtract`, `multiply`, `divide`.
Each takes two doubles and returns a double.

Read two numbers and an operator (+, -, *, /) from the user.
Call the right function based on the operator and print the result.

```
Enter first number: 15
Enter second number: 4
Enter operator (+, -, *, /): *
15.0 * 4.0 = 60.0
```

---

## 🟡 Intermediate

### Exercise 3 — Grade Classifier
**Concepts:** Functions, return values, optional parameters

Write a function `classifyGrade(int score, [String subject = 'General'])` that:
- Returns the letter grade (A/B/C/D/F)
- Prints a message including the subject name

Read a subject name and score from the user. Call the function and display
a full report.

---

### Exercise 4 — Receipt Calculator (Refactored)
**Concepts:** Multiple functions working together, user input

Take your Week 2 Receipt Generator and refactor it into functions:
- `double calculateLineTotal(double price, int qty)` 
- `double calculateSubtotal(List<double> lineTotals)`
- `double calculateTax(double subtotal, [double rate = 0.10])`
- `void printReceipt(...)` — prints the formatted output

Read at least 3 items from the user (name, price, quantity each).

---

## 🔴 Challenge

### Exercise 5 — Number Utilities Library
**Concepts:** Arrow functions, multiple return types, edge cases

Build a set of utility functions:
- `bool isPrime(int n)` — returns true if n is prime
- `int factorial(int n)` — returns n! (use a loop, not recursion)
- `List<int> fibonacci(int count)` — returns first `count` Fibonacci numbers
- `bool isPalindrome(String word)` — returns true if word reads same forwards/backwards

Read a number from the user and demonstrate all four functions with it.
