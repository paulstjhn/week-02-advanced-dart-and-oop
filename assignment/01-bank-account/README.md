# Assignment 1 — Bank Account with Transaction History

**Difficulty:** 🟢 Beginner  
**Due:** One week from today  
**Submission:** Push to your personal GitHub repo and share the link

---

## The Brief

You're building the core of a banking application. This time,
instead of a script with loose variables (like Week 2's ATM), you'll
model the bank account as a **proper class** with encapsulation,
methods, and a full transaction history.

This assignment connects directly to Week 2 — you'll recognise the
logic, but now you'll structure it the right way.

---

## Requirements

### The `BankAccount` Class Must Have:

**Private fields:**
- `_owner` (String)
- `_balance` (double)
- `_accountNumber` (String)
- `_transactions` (List of Strings — transaction log)
- `_pin` (String)

**Getters (read-only access):**
- `owner`, `balance`, `accountNumber`

**Methods:**
- `bool verifyPin(String input)` — returns true if pin matches
- `void deposit(String pin, double amount)` — validates pin then amount
- `void withdraw(String pin, double amount)` — validates pin, checks funds
- `void printStatement(String pin)` — prints all transactions if pin correct
- `void printBalance(String pin)` — prints current balance if pin correct

**Validation rules:**
- Deposit/withdrawal amount must be greater than 0
- Withdrawal cannot exceed current balance
- Wrong PIN prints a clear rejection — does NOT crash

---

## Simulate This Sequence

Starting balance: **₦45,000.00**, PIN: **'2580'**

1. Check balance (correct PIN)
2. Deposit ₦15,000
3. Withdraw ₦8,000
4. Attempt to withdraw ₦60,000 (should fail — insufficient funds)
5. Attempt a deposit with wrong PIN (should fail)
6. Check balance (correct PIN)
7. Print full transaction history

---

## User Input

Read the following from the user at program start:
- Account holder name
- Starting balance
- PIN (4-digit string)

All transactions use the above, but the amounts and sequence
are hardcoded as described above.

---

## Expected Output Format

```
╔═══════════════════════════════════╗
║         DART BANK PLC             ║
╚═══════════════════════════════════╝
Account: Alice Johnson | No: ACC-2024

[BALANCE] ₦45,000.00
──────────────────────────────────

[DEPOSIT] ₦15,000.00 ✓
New Balance: ₦60,000.00
──────────────────────────────────

[WITHDRAWAL] ₦8,000.00 ✓
New Balance: ₦52,000.00
──────────────────────────────────

[WITHDRAWAL DECLINED]
Requested: ₦60,000.00 | Available: ₦52,000.00
──────────────────────────────────

[DEPOSIT DECLINED] Wrong PIN
──────────────────────────────────

[BALANCE] ₦52,000.00
──────────────────────────────────

=== Transaction History ===
1. Opening balance: ₦45,000.00
2. Deposit: +₦15,000.00
3. Withdrawal: -₦8,000.00
4. Withdrawal declined: ₦60,000.00
5. Deposit declined: wrong PIN
```

---

## Hints

- Store transaction descriptions as Strings in a List — e.g. `'Deposit: +₦15,000.00'`
- Use a method for PIN verification — don't copy-paste the check everywhere
- Add transactions to the log even for declined operations — the history should be complete

---

## Submission Checklist

- [ ] `BankAccount` class with all private fields and public methods
- [ ] All 7 transactions simulated in order
- [ ] PIN validation works correctly on every operation
- [ ] All validation rules enforced with clear messages
- [ ] Transaction history is complete and prints correctly
- [ ] User input reads name, balance, and PIN at start
- [ ] At least **4 inline comments** explaining key decisions
- [ ] Pushed to GitHub with a clear commit message
