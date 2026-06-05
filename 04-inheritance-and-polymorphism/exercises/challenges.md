# Exercises — Inheritance and Polymorphism

---

## 🟢 Beginner

### Exercise 1 — Vehicle Hierarchy
**Concepts:** `extends`, `super`, `@override`

Create:
- `Vehicle` parent with: `brand` (String), `speed` (int), `move()` method
- `Car extends Vehicle` — overrides `move()` to say "drives on road"
- `Boat extends Vehicle` — overrides `move()` to say "sails on water"
- `Plane extends Vehicle` — overrides `move()` to say "flies in the sky"

Read a vehicle type from the user, create the right subclass,
and call `move()`.

---

## 🟡 Intermediate

### Exercise 2 — Employee Payroll
**Concepts:** Abstract class, `@override`, polymorphism, user input

Create abstract class `Employee` with:
- Fields: `name` (String), `hoursWorked` (double)
- Abstract method: `double calculateSalary()`
- Concrete method: `void printPayslip()`

Subclasses:
- `FullTimeEmployee` — fixed monthly salary of 50000 regardless of hours
- `PartTimeEmployee` — hourly rate of 1500 per hour worked
- `Contractor`       — hourly rate of 3000 per hour, max 160 hours billable

Read employee type, name, and hours from the user.
Create the right object and print the payslip.

---

## 🔴 Challenge

### Exercise 3 — Animal Shelter
**Concepts:** Inheritance, polymorphism, List of parent type, user menu

Create an `Animal` hierarchy:
- `Animal` (abstract): `name`, `age`, abstract `String sound()`
- `Dog`, `Cat`, `Bird` — each implements `sound()` differently
- Each subclass has one unique method (e.g. Dog has `fetch()`)

Create an `AnimalShelter` class with a `List<Animal>` and methods:
- `void admit(Animal a)` — adds to shelter
- `void makeAllSounds()` — loops through all animals and calls `sound()`
- `void listAll()` — prints all animals with type and name
- `Animal? find(String name)` — returns animal or null

Build a user menu: admit / list all / make sounds / find / exit.
