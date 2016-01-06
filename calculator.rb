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

def operation_to_message(operation)
  case operation
  when 'a'
    "Adding"
  when 's'
    "Subtracting"
  when 'm'
    "Multiplying"
  when 'd'
    "Dividing"
  end
end

prompt("Welcome to Calculator!  Please enter your name:")

name = ''
loop do
  name = gets().chomp()

  if name.empty?()
    prompt("Be sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")
sleep 0.5

loop do # main loop
  number1 = ''
  loop do
    prompt("Enter the first number:")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("You must enter a valid number.")
      sleep 0.5
    end
  end

  number2 = ''
  loop do
    prompt("Enter the second number:")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("You must enter a valid number.")
      sleep 0.5
    end
  end

  operator_prompt = <<-MSG
  Which operation will we perform?
    Enter 'a' to add
    Enter 's' to subtract
    Enter 'm' to multiply
    Enter 'd' to divide
  MSG

  prompt(operator_prompt)

  operation = ''
  loop do
    operation = gets.chomp

    if %w(a s d m).include?(operation)
      break
    else
      prompt("You must select 'a', 's', 'm', or 'd'.")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  answer = case operation
           when 'a'
             number1.to_f + number2.to_i
           when 's'
             number1.to_f - number2.to_i
           when 'm'
             number1.to_f * number2.to_i
           when 'd'
             begin
               number1.to_f / number2.to_i
             rescue
               "undefined.  Cannot divide by zero."
             end
           else
             "Operation must be 'a', 's', 'm' or 'd'."
           end

  prompt("The answer is #{answer}")

  prompt("Do you want to perform another calculation? (Enter Y for yes)")

  repeat = gets().chomp()
  break unless repeat.downcase().start_with?('y')
end

prompt("Hope Calculator was helpful!")
