# Assignment 2 — Employee Payroll System

**Difficulty:** 🟡 Intermediate  
**Due:** One week from today  
**Submission:** Push to your personal GitHub repo and share the link

---

## The Brief

You're building a payroll system for a company with three types
of employees. Each type has a different salary calculation. The
system should process a list of employees and generate payslips.

This assignment puts **inheritance** and **polymorphism** to work
in a realistic scenario.

---

## Requirements

### Class Hierarchy

**Abstract base class `Employee`:**
- Fields: `name` (String), `id` (String), `hoursWorked` (double)
- Abstract method: `double calculateSalary()`
- Abstract getter: `String employeeType`
- Concrete method: `void printPayslip()` — prints a formatted payslip

**Subclasses:**

| Class | Salary Rule |
|-------|------------|
| `FullTimeEmployee` | Fixed ₦85,000/month regardless of hours |
| `PartTimeEmployee` | ₦2,500 per hour worked |
| `Contractor` | ₦5,000 per hour, capped at 160 billable hours |

---

## User Input

At program start, ask the user how many employees to add (min 3).
For each employee, read:
- Employee type (fulltime / parttime / contractor)
- Name
- Employee ID
- Hours worked this month

---

## Features Required

1. Store all employees in a `List<Employee>`
2. After input, loop through and print each payslip
3. Calculate and print a **company payroll summary**:
   - Total employees
   - Total payroll cost
   - Highest paid employee
   - Lowest paid employee
4. **Error handling:** Wrap all input parsing in try/catch.
   If the user enters invalid hours, re-prompt.

---

## Expected Payslip Format

```
╔═══════════════════════════════════╗
║        PAYSLIP — MAY 2024         ║
╚═══════════════════════════════════╝
Name:          Alice Johnson
ID:            EMP-001
Type:          Full-Time Employee
Hours Worked:  160.0
─────────────────────────────────────
Gross Salary:  ₦85,000.00
─────────────────────────────────────

╔═══════════════════════════════════╗
║        PAYROLL SUMMARY            ║
╚═══════════════════════════════════╝
Total Employees:  3
Total Payroll:    ₦215,000.00
Highest Paid:     Alice Johnson (₦85,000.00)
Lowest Paid:      Bob Smith (₦40,000.00)
```

---

## Hints

- `runtimeType` gives you the class name as a String — useful for `employeeType`
- Or override `employeeType` in each subclass to return a readable label
- The payroll summary needs a loop to find max/min — use the same pattern as Week 2

---

## Submission Checklist

- [ ] Abstract `Employee` class with `calculateSalary()` and `printPayslip()`
- [ ] All three subclasses with correct salary calculations
- [ ] User input loop reads all employees correctly
- [ ] All payslips print in the correct format
- [ ] Payroll summary shows totals, highest, and lowest paid
- [ ] Input errors (invalid numbers) are caught and re-prompted
- [ ] At least **4 inline comments** explaining key decisions
- [ ] Pushed to GitHub with a clear commit message
