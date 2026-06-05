# Exercises — Error Handling

---

## 🟢 Beginner

### Exercise 1 — Safe Number Reader
**Concepts:** try/catch, FormatException, re-prompting loop

Write a function `int readInteger(String prompt, int min, int max)`
that keeps asking until the user enters a valid integer within the range.

Use it to read:
- A score between 0 and 100
- An age between 0 and 120
- A menu choice between 1 and 4

---

### Exercise 2 — Division Guard
**Concepts:** try/catch, throwing exceptions, specific exception types

Write a `safeDivide(double a, double b)` function that:
- Throws an `ArgumentError` if `b` is zero
- Returns the result otherwise

Wrap the call in a try/catch. Read both numbers from the user.
Handle the zero case gracefully without crashing.

---

## 🟡 Intermediate

### Exercise 3 — Custom Validation Exceptions
**Concepts:** Custom exceptions, throwing, catching by type

Create these custom exception classes:
- `EmptyFieldException(String fieldName)`
- `InvalidRangeException(String field, int min, int max, int actual)`
- `InvalidFormatException(String field, String expected)`

Write a `validateUserInput(name, age, email)` function that
throws the appropriate exception for any invalid field.

Read name, age, and email from the user. Call the validator.
Print a specific, helpful error message for each exception type.

---

## 🔴 Challenge

### Exercise 4 — Robust ATM with Error Handling
**Concepts:** All error handling concepts, user input loop, custom exceptions

Build on the Week 2 ATM — now with full error handling:

Custom exceptions:
- `InsufficientFundsException(requested, balance)`
- `InvalidAmountException(amount)` — for zero or negative amounts
- `WrongPinException()` — for incorrect PIN entry
- `AccountLockedException()` — after 3 wrong PIN attempts

Features:
- PIN protected (hardcode PIN as '1234')
- Lock account after 3 failed PIN attempts
- All withdrawal/deposit inputs validated with re-prompting
- Every operation wrapped in try/catch with specific messages
- Transaction log printed at the end
