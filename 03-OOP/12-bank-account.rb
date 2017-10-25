=begin
# Assignment: Bank Account

We are going to create a BankAccount class. This class will recreate some of the common account transactions that normally occur for a bank account such as displaying your account number, checking and savings amount, total amount. Of course, there are also methods to invoke such as depositing a check, checking your balance, withdrawing money

 >> bank_account.rb

  class BankAccount
    # your code here
  end

- BankAccount should have a method that returns a user's account number, account number should be generated by a private method, account number should be random

- BankAccount should have a method that returns the user's checking account balance

- BankAccount should have a method that returns the user's saving account balance

- BankAccount should allow a user to deposit money into either their checking or saving account

- BankAccount should allow a user to withdraw money from one of their accounts, return an error if there are insufficient funds

- BankAccount should allow the user to view the total amount of money they have at the bank

- BankAccount should track how many accounts the bank currently has  Add an interest_rate attribute that is not accessible by the user. Set it to 0.01

- BankAccount should have a method called account_information that displays the users account number, total money, checking account balance, saving account balance and interest rate  A user should not be able to set any attributes from the BankAccount class
=end

class Checking
  attr_reader :acct_number, :balance, :type

  # Initialize account with zero balance, account # and assign to an owner:
  def initialize(owner_acct)
    @balance = 0.0
    @interest_rate = 0.0001
    @acct_owner = owner_acct
    @acct_number = 5.times.map { Random.rand(10) }.join('')
    @type = "Checking"
    puts '------------------------------'
    puts "CHECKING (##{@acct_number}):"
    puts ">>>> Balance: $#{@balance}"
    puts ">>>> Owner #: #{@acct_owner}"
    puts '------------------------------'
  end

  # Returns checking balance:
  def get_balance
    # Note the string formatting in the puts statement below.
    # Please see the following links for more:
    # http://ruby-doc.org/core-2.0.0/Kernel.html#method-i-sprintf
    # https://stackoverflow.com/questions/10459901/how-do-you-round-a-float-to-two-decimal-places-in-jruby
    puts "Checking Balance (##{@acct_number}): $#{"%.2f" % @balance}"
    @balance
  end

  # Deposit to checking:
  def deposit(value)
    @balance += value
  end

  # Withdraw from checking:
  def withdraw(value)
    if (@balance - value) < 0
      error = {message: "Insufficient funds -- Current balance: $#{"%.2f" % @balance}"}
      puts error[:message]
      error
    else
      @balance -= value
    end
  end

  # Get interest rate:
  def get_interest_rate
    "%.2f" % (@interest_rate * 100)
  end
end

class Savings
  attr_reader :acct_number, :balance, :type

  # Initialize account with zero balance, account # and assign to account owner:
  def initialize(owner_acct)
    @balance = 0.0
    @interest_rate = 0.0001
    @acct_owner = owner_acct
    @acct_number = 5.times.map { Random.rand(10) }.join('')
    @type = "Savings"
    puts '------------------------------'
    puts "SAVINGS (##{@acct_number}):"
    puts ">>>> Balance: $#{@balance}"
    puts ">>>> Owner #: #{@acct_owner}"
    puts '------------------------------'
  end

  # Return savings balance:
  def get_balance
    # Note the string formatting in the puts statement below.
    # Please see the following links for more:
    # http://ruby-doc.org/core-2.0.0/Kernel.html#method-i-sprintf
    # https://stackoverflow.com/questions/10459901/how-do-you-round-a-float-to-two-decimal-places-in-jruby
    puts "Savings Balance (##{@acct_number}): $#{"%.2f" % @balance}"
    @balance
  end

  # Deposit to savings:
  def deposit(value)
    @balance += value
  end

  # Withdraw from savings:
  def withdraw(value)
    if (@balance - value) < 0
      error = {message: "Insufficient funds -- Current balance: #{@balance}"}
      puts error[:message]
      error
    else
      @balance -= value
    end
  end

  # Get interest rate:
  def get_interest_rate
    "%.2f" % (@interest_rate * 100)
  end
end

class BankAccount
  attr_reader :account_number

  # Initialize new account with an account #:
  def initialize
    @accts = []
    @account_number = generate_acct_num
  end

  # Get account number (retrieves private method):
  def acct_num
    get_acct_num
  end

  # Makes a new checking account, assigned to owner:
  def make_checking(owner_account_number)
    checking = Checking.new(owner_account_number)
    @accts.push(checking)
    self
  end

  # Makes a new savings account, assigned to owner:
  def make_savings(owner_account_number)
    savings = Savings.new(owner_account_number)
    @accts.push(savings)
    self
  end

  # Returns all accounts owned by this bank account:
  def get_accounts
    @accts
  end

  # Return count of all accounts:
  def count_accts
    puts "Total number of accounts: #{@accts.length}"
    @accts
  end

  # Deposit money to any account:
  def deposit(account, value)
    # Find any acct matching account #:
    for i in 0..(@accts.length-1)
      if @accts[i].acct_number == account
        @accts[i].deposit(value)
      end
    end
  end

  # Withdraw money from any account:
  def withdraw(account, value)
    # Find any acct matching account #:
    for i in 0..(@accts.length-1)
      if @accts[i].acct_number == account
        @accts[i].withdraw(value)
      end
    end
  end

  # Provide total balanace for all accounts:
  def total_balance
    total = 0
    for i in 0..(@accts.length-1)
      total += @accts[i].balance
    end
    total
  end

  # Get interest rates:
  def get_interest_rates
    puts "------ INTEREST RATES -----"
    for i in 0..(@accts.length-1)
      puts ">>>> Acct ##{@accts[i].acct_number}"
      puts ">>>> #{@accts[i].get_interest_rate}%"
    end
    puts "---------------------------"
  end

  # Print full report:
  def print_report
    get_report
  end

  private # Begin private methods

  # Retreive bank account number:
  def get_acct_num
    @account_number
  end

  # Get full report:
  def get_report
    puts "=========== ACCOUNT STATEMENT ==========="
    puts "Bank Account #: #{self.acct_num}"
    puts "--------------- ACCOUNTS ----------------"
    # Print out individual accounts and balances:
    for i in 0..(@accts.length-1)
      puts ">> #{@accts[i].type} (##{@accts[i].acct_number})"
      puts ">>>> Interest Rate: #{@accts[i].get_interest_rate}%"
      puts ">>>> Balance: $#{"%.2f" % @accts[i].balance}"
    end
    # Total balance:
    puts "> Total Balance: $#{"%.2f" % self.total_balance}"
    puts "-----------------------------------------"
    puts "========================================="
  end

  # Generate a bank account number:
  def generate_acct_num
    @account_number = 16.times.map { Random.rand(10) }.join('')
    puts '======================================'
    puts "BANK ACCT #: #{@account_number}"
    puts '======================================'
    @account_number
  end
end

=begin
  In the section below, we'll test the above classes we've built. I did choose to create unique classes for both `Checking` and `Savings` accounts, thus our calling of methods is probably a little more complex than it could be. However, this gives us a lot of freedom, and each checking or savings account is its own object with many properties and methods.

  Begin testing our class methods here:
=end

my_account = BankAccount.new # Make a new acct

my_account.make_checking(my_account.acct_num) # Make checking acct
my_account.make_savings(my_account.acct_num) # Make savings acct

my_account.count_accts # count # of accounts

# Loop through accounts and give balance:
puts '------------------------------'
for i in 0..(my_account.get_accounts.length - 1)
  my_account.get_accounts[i].get_balance
end
puts '------------------------------'

# Deposit 500 to checking:
my_account.deposit(my_account.get_accounts[0].acct_number, 500)

# Deposit to savings:
my_account.deposit(my_account.get_accounts[1].acct_number, 500)

# Withdraw from checking:
my_account.withdraw(my_account.get_accounts[0].acct_number, 250)
my_account.withdraw(my_account.get_accounts[0].acct_number, 250)
my_account.withdraw(my_account.get_accounts[0].acct_number, 250)

# Get balances:
my_account.get_accounts[0].get_balance
my_account.get_accounts[1].get_balance

# Withdraw money from savings:
my_account.withdraw(my_account.get_accounts[1].acct_number, 1021)
my_account.get_accounts[1].get_balance

# Get total balance:
puts my_account.total_balance

# Deposit more money to checking and savings:
my_account.deposit(my_account.get_accounts[0].acct_number, 6500)
my_account.deposit(my_account.get_accounts[1].acct_number, 500)

# Get total balance:
my_account.total_balance
my_account.get_interest_rates

# Print full report:
my_account.print_report

# Development Notes:
# You probably could have simplified this code by simply creating an "Account" class, instead of a seperate Checking and Savings class. And instead give this class a type, of which you could define the type of account it is. This was good practice playing around with classes however, which was the point of the exercise.
