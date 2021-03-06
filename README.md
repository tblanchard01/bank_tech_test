


# Bank tech test

## To run code: 

1. Clone the Repo from Github.
2. Make sure you have Ruby installed. 
3. Open the folder of the cloned Repo in your terminal.
4. Type 'irb' into the terminal.
5. Type require './lib/account'.
6. If the file has loaded sucsessfully, you will be greeted wtih "=>true"


## To Interact with the bank: 

1) Create an Account by writing [name_here] = Account.new. 
2) Each transaction takes an ammount, if date is left blank, today's date is inputted 
3) Calling 'print_statement' on the Account object will print the statement. 

```
EXAMPLE:
acc = Account.new 
acc.deposit(1000, '10-01-2012')
acc.deposit(2000, '13-01-2012')
acc.withdraw(500, '14-01-2012')
acc.print_statement
```

```

GIVES: 

date || credit (£) || debit (£) || balance (£)
===============================================
14-01-2012 ||  || 500.00 || 2500.00
13-01-2012 || 2000.00 ||  || 3000.00
10-01-2012 || 1000.00 ||  || 1000.00
```





## User Stories 

1) As as a Bank user, 
so I can review my account activity, 
I can request a print-out of my bank statement. 

2) As a Bank user, 
so I can keep my money safe, 
I would like to be able to deposit funds. 

3) As a Bank user, 
so I can spend my money, 
I would like to be able to withdraw funds. 

# Makers Instructions 

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
