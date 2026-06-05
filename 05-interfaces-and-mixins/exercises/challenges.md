# Exercises — Interfaces and Mixins

---

## 🟢 Beginner

### Exercise 1 — Printable Interface
**Concepts:** `implements`, interface contract

Define a `Printable` interface with `void printSummary()`.

Implement it in three unrelated classes:
- `Invoice` (invoiceNumber, amount, clientName)
- `Student` (name, grade, course)
- `Vehicle` (brand, model, year)

Store all three in a `List<Printable>` and call `printSummary()` on each.

---

## 🟡 Intermediate

### Exercise 2 — Loggable and Serializable Mixins
**Concepts:** Multiple mixins, mixin methods

Create two mixins:
- `Loggable` — adds `void log(String msg)` and `void printLogs()`
- `Serializable` — adds `String serialize()` that returns
  a comma-separated string of the object's key fields

Apply both to a `Transaction` class with: `id`, `amount`, `type` (deposit/withdrawal).

Read transaction details from the user. Create the transaction.
Log a message. Print logs. Print the serialized form.

---

## 🔴 Challenge

### Exercise 3 — Role-Based Access System
**Concepts:** Interfaces, polymorphism, user input, validation

Define a `UserRole` interface with:
- `bool canRead()`
- `bool canWrite()`
- `bool canDelete()`
- `bool canManageUsers()`
- `String roleName()`

Implement four roles: `Admin`, `Editor`, `Viewer`, `Guest`
(each with appropriate permissions).

Create a `SystemAction` class that takes a `UserRole` and methods:
- `void attemptRead()`
- `void attemptWrite()`
- `void attemptDelete()`
- `void attemptManageUsers()`

Each `attempt` method checks the role's permission and either
performs the action or prints an access denied message.

Read a role from the user, create the right role object, then
present a menu of actions for them to attempt.
