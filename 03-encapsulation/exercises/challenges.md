# Exercises — Encapsulation

---

## 🟢 Beginner

### Exercise 1 — Validated Profile
**Concepts:** Private fields, getters, setters with validation

Create a `UserProfile` class with private fields: `_username`, `_email`, `_age`.

Validation rules:
- Username: cannot be empty, min 3 characters
- Email: must contain `@`
- Age: must be between 0 and 120

Read all three from the user. Try setting an invalid value for each
(hardcode the invalid attempt) and show the rejection message.

---

### Exercise 2 — Temperature Gauge
**Concepts:** Private field, getter, setter, computed getter

Create a `TemperatureGauge` with a private `_celsius` field.

- Setter: rejects values below -273.15 (absolute zero)
- Getter for celsius
- Computed getter for fahrenheit
- Computed getter `String get status` returning:
  `'Freezing'` / `'Cold'` / `'Warm'` / `'Hot'` based on celsius

Read a temperature from the user and print all values.

---

## 🟡 Intermediate

### Exercise 3 — Exam Score Manager
**Concepts:** Private list, controlled access, computed getters

Create an `ExamRecord` class with:
- Private `_scores` list (cannot be modified directly from outside)
- `void addScore(int score)` — validates 0–100 before adding
- `List<int> get scores` — returns an **unmodifiable** copy
- Computed getters: `average`, `highest`, `lowest`, `String grade`

Read a student name and scores (until user types 'done') from the console.
Print the full exam record.

---

## 🔴 Challenge

### Exercise 4 — Secure Wallet
**Concepts:** Encapsulation, transaction log, validation, user input loop

Create a `Wallet` class with:
- Private `_balance` (double)
- Private `_pin` (String) — set in constructor, never readable from outside
- Private `_transactions` list (List of strings — log entries)

Methods:
- `bool verifyPin(String input)` — returns true if pin matches, never exposes pin
- `void deposit(String pin, double amount)` — validates pin first, then amount
- `void withdraw(String pin, double amount)` — validates pin, then funds
- `void printHistory(String pin)` — prints transaction log if pin correct

Build a console menu that asks for the PIN before every operation.
