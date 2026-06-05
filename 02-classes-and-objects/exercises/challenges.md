# Exercises — Classes and Objects

---

## 🟢 Beginner

### Exercise 1 — Product Class
**Concepts:** Fields, constructor, methods, toString

Create a `Product` class with: `name`, `price` (double), `quantity` (int).

Methods:
- `double totalValue()` — returns price × quantity
- `void restock(int amount)` — adds to quantity
- Override `toString()`

Read a product's details from the user, create the object, restock it
by a user-entered amount, and print the updated product.

---

### Exercise 2 — Student Class
**Concepts:** Fields, constructor, computed method, List of objects

Create a `Student` class with: `name`, three test scores (int each).

Methods:
- `double average()` — returns average of three scores
- `String grade()` — returns letter grade based on average
- Override `toString()`

Read details for 3 students from the user. Store them in a `List<Student>`.
Print all three and identify who has the highest average.

---

## 🟡 Intermediate

### Exercise 3 — Library Book System
**Concepts:** Named constructors, methods that change state, user input

Create a `Book` class with: `title`, `author`, `isAvailable` (bool, default true).

Named constructor: `Book.unavailable(title, author)` — creates a checked-out book.

Methods:
- `void checkOut()` — marks as unavailable (print message if already out)
- `void returnBook()` — marks as available
- Override `toString()`

Create 3 books (at least one unavailable). Read a title from the user,
find it in the list, and check it out.

---

## 🔴 Challenge

### Exercise 4 — Mini Contact Book
**Concepts:** Class with a List field, multiple methods, user input loop

Create a `Contact` class with: `name`, `phone`, `email`.

Create a `ContactBook` class with a `List<Contact>` field and methods:
- `void addContact(Contact c)`
- `void removeContact(String name)`
- `Contact? findContact(String name)` — returns null if not found
- `void printAll()`

Build a simple menu loop that reads user commands:
```
1. Add contact
2. Find contact
3. Remove contact
4. Print all
5. Exit
```
