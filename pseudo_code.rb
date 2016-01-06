# to define a method for each example, encase the logic as follows:
def method_name
  logic
end

# 1.
Ask for a first number, then ask for a second number.
Add the two numbers together.

START

GET first number from user, and SET to "number1"
GET second number from user, and SET to "number2"
PRINT sum of "number1" and "number2"

END

# 2.
Given an array of string,
Combine each element of the array into a single string

START

# Given an array of strings called "strings"

SET final_string to ""
For each element in "strings", final_string concatenates element
PRINT final_string

# 3.

# Given an array of integers called "integers"

Make a new array called final_array, and set it equal to [].
Add every other element in "integers" to final_array.

START

# Given an array of integers called "integers"

SET final_array = []
SET iterator = 0
WHILE iterator is less than length of "integers"
final_array concatenates integers[iterator]
increment iterator by 2
PRINT final_array

