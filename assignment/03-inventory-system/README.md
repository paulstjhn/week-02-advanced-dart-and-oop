# Assignment 3 — Simple Inventory System

**Difficulty:** 🔴 Challenge  
**Due:** One week from today  
**Submission:** Push to your personal GitHub repo and share the link

---

## The Brief

You're building a console-based inventory management system for a
small shop. This is the most complete project you've built so far —
it combines classes, encapsulation, inheritance, mixins, error
handling, and user input all in one working application.

---

## Requirements

### Class Hierarchy

**Abstract base class `Product`:**
- Private fields: `_id`, `_name`, `_price`, `_quantity`
- Getters for all fields
- Setter for `_price` — must be greater than 0
- Setter for `_quantity` — must be >= 0
- Abstract method: `String category()`
- Concrete method: `double totalValue()` — price × quantity
- Override `toString()`

**Subclasses (at least 2):**
- `ElectronicsProduct` — adds `warrantyMonths` (int)
- `FoodProduct` — adds `expiryDate` (String) and overrides `toString()`

**`Loggable` mixin:**
- `void log(String message)` — adds timestamped entry to private list
- `void printLogs()` — prints all log entries

**`Inventory` class (uses `Loggable`):**
- Private `_products` list
- `void addProduct(Product p)` — validates no duplicate ID, logs action
- `void removeProduct(String id)` — removes by ID, logs action
- `void restockProduct(String id, int quantity)` — adds to quantity, logs
- `Product? findById(String id)` — returns product or null
- `void printAll()` — prints all products formatted
- `void printSummary()` — total products, total inventory value, low-stock alert (qty < 5)

---

## User Input Menu

After setup, present a looping menu:

```
=== INVENTORY SYSTEM ===
1. Add product
2. Remove product
3. Restock product
4. Find product
5. View all products
6. View summary
7. View activity log
8. Exit
```

Keep looping until user selects 8.

---

## Error Handling Requirements

- Invalid menu choice → print message and re-show menu (no crash)
- Invalid price or quantity input → re-prompt
- Duplicate product ID on add → clear error message
- Product not found on remove/restock/find → clear error message
- All number parsing wrapped in try/catch

---

## Hints

- Start with the classes, then build the Inventory, then the menu
- Test each class independently before connecting them
- The menu loop is: `while (true)` + `break` on exit

---

## Submission Checklist

- [ ] `Product` abstract class with all private fields, getters, setters
- [ ] At least 2 concrete subclasses
- [ ] `Loggable` mixin applied to `Inventory`
- [ ] `Inventory` class with all required methods
- [ ] Full menu loop with all 8 options working
- [ ] All error handling requirements met
- [ ] Activity log prints with at least timestamps
- [ ] At least **6 inline comments** explaining architectural decisions
- [ ] Pushed to GitHub with a clear commit message
