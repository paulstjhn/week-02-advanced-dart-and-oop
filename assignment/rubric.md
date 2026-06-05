# Assignment Rubric — Week 3
### (For mentor use only — do not share with mentees)

---

## Assignment 1 — Bank Account with Transaction History (100 marks)

| Criteria | Marks | Notes |
|----------|-------|-------|
| BankAccount class with all private fields | 15 | Check _owner, _balance, _pin, _transactions |
| Getters implemented correctly | 10 | balance, owner, accountNumber — read only |
| verifyPin() works correctly | 10 | Returns true/false, never exposes pin |
| deposit() validates PIN and amount | 15 | Both checks required |
| withdraw() validates PIN, amount, and funds | 15 | All three checks required |
| Transaction log is complete | 15 | Includes declined operations |
| printStatement() requires correct PIN | 10 | Should reject wrong PIN |
| User input reads name, balance, PIN | 5 | At program start |
| Comments explain key decisions | 5 | At least 4 meaningful comments |
| **Total** | **100** | |

**Common issues:**
- Updating balance before validation — always validate first
- PIN check copy-pasted instead of calling verifyPin()
- Transaction log missing declined operations
- toString() on balance without toStringAsFixed(2)

---

## Assignment 2 — Employee Payroll System (100 marks)

| Criteria | Marks | Notes |
|----------|-------|-------|
| Abstract Employee class with abstract calculateSalary() | 15 | Must be abstract |
| FullTimeEmployee — fixed salary correct | 10 | ₦85,000 flat |
| PartTimeEmployee — hourly rate correct | 10 | ₦2,500 × hours |
| Contractor — capped calculation correct | 15 | ₦5,000 × min(hours, 160) |
| Polymorphism — all stored in List<Employee> | 10 | Must use parent type |
| All payslips print correctly formatted | 15 | Check all fields |
| Payroll summary correct (total, highest, lowest) | 15 | All three required |
| Input error handling (invalid hours re-prompted) | 5 | try/catch required |
| Comments explain key decisions | 5 | At least 4 meaningful |
| **Total** | **100** | |

**Common issues:**
- Not using abstract — calculateSalary() defined with a body in parent
- Contractor cap not applied — just multiplying hours × rate
- Payroll summary hardcoded instead of computed from the list
- List typed as List<FullTimeEmployee> instead of List<Employee>

---

## Assignment 3 — Simple Inventory System (100 marks)

| Criteria | Marks | Notes |
|----------|-------|-------|
| Product abstract class with private fields + getters | 10 | All fields private |
| Setters validate price > 0 and quantity >= 0 | 10 | Both validations needed |
| At least 2 concrete subclasses with category() | 10 | Each must override toString() |
| Loggable mixin with timestamped log + printLogs | 10 | Must show timestamps |
| Inventory class with all 6 required methods | 20 | Check each method |
| Full menu loop (all 8 options working) | 15 | Test all paths |
| Error handling on all inputs and operations | 15 | No crashes on bad input |
| Comments explain architectural decisions | 10 | At least 6 meaningful |
| **Total** | **100** | |

**Common issues:**
- Public fields instead of private with getters/setters
- Loggable mixin without timestamps — just appending messages
- findById() not returning null when not found — causes null errors later
- Menu crashing on invalid input instead of re-prompting

---

## Feedback Template

```
Hi [Name],

Great effort on Week 3's assignment — OOP is a big conceptual leap
and you've shown real progress!

✅ What you did well:
- [specific praise]
- [specific praise]

🔧 Areas to improve:
- [specific, actionable feedback]
- [specific, actionable feedback]

💡 Something to think about:
[one forward-looking observation — connect to Flutter if possible]

Score: [X]/100
```

---

## Code Review Session Notes (Week 4 warm-up)

Select 2-3 submissions anonymously:
1. One that demonstrates good encapsulation
2. One that has a common mistake (e.g. public fields, missing validation)
3. One that solved the Contractor cap in an interesting way

Walk through each with the group. Ask mentees to explain what they
see before you do — active reading beats passive listening.
