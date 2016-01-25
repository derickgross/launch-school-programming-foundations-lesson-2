def prompt(message)
  puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(number)
  integer?(number) || float?(number)
end

prompt("Welcome to Mortgage Calculator!  Please enter your name:")

name = ''
loop do
  name = gets().chomp()

  if name.empty?()
    prompt("Be sure to use a valid name.")
  else
    break
  end
end

loop do
  prompt("#{name}, please enter your loan amount:")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      break
    else
      prompt("Be sure to enter a valid number for your loan amount.")
    end
  end

  prompt("And what is the annual percentage rate (APR) of your loan?")

  apr = ''
  loop do
    apr = gets.chomp

    if valid_number?(apr)
      break
    else
      prompt("Be sure to enter a valid number for your APR.")
    end
  end

  prompt("Please enter your original loan duration (in years):")

  duration_in_years = ''
  loop do
    duration_in_years = gets.chomp

    if valid_number?(duration_in_years)
      break
    else
      prompt("Please enter a valid number for your loan duration.")
    end
  end

  duration_in_months = duration_in_years.to_i * 12

  prompt("Please enter your remaining loan duration (in months).  This is your original loan duration minus the number of months you've paid already:")

  duration_remaining = ''
  loop do
    duration_remaining = gets.chomp

    break if valid_number?(duration_remaining)
    cprompt("Please enter a valid number for your remaining loan duration.")
  end

  apr_decimal = apr.to_f / 100

  monthly_interest_rate = apr_decimal / 12

  monthly_payment = (loan_amount.to_f * (monthly_interest_rate * (1 + monthly_interest_rate)**duration_in_months.to_i)) / (
    ((1 + monthly_interest_rate)**duration_in_months.to_i) - 1)

  remaining_loan_balance = loan_amount.to_f * ((1 + monthly_interest_rate)**duration_in_months.to_i - (1 + monthly_interest_rate)**(duration_in_months.to_i - duration_remaining.to_i)) / ((1 + monthly_interest_rate)**duration_in_months.to_i - 1)

  prompt("Your monthly payment is $#{format('%02.2f', monthly_payment)}.  After paying #{duration_in_months.to_i - duration_remaining.to_i} of your original loan, your remaining balance is $#{format('%02.2f', remaining_loan_balance)}.")

  prompt("Another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Mortgage Calculator!")
