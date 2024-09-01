#!/bin/bash

# Function to display an error message and exit the script
# Arguments:
#   $1 - The error message to be displayed
# Outputs:
#   Prints the error message to standard error and exits the script with a status of 1
error_exit() {
  echo "Error: $1" >&2  # Redirect the error message to standard error
  exit 1  # Exit the script with a non-zero status indicating failure
}

# Function to validate if the input is a number
# Arguments:
#   $1 - The input value to be validated
# Returns:
#   0 if the input is a valid number, 1 otherwise
is_number() {
  [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]  # Regular expression to match both integers and floating-point numbers
}

# Function to perform the calculation based on the operator provided
# Uses bc (basic calculator) for precise arithmetic calculations
# Globals:
#   operator - The arithmetic operator entered by the user
#   num1 - The first operand
#   num2 - The second operand
#   result - The result of the calculation
# Outputs:
#   Prints the result of the calculation to the console
calculate() {
  case $operator in
    +) result=$(echo "$num1 + $num2" | bc -l) ;;  # Addition
    -) result=$(echo "$num1 - $num2" | bc -l) ;;  # Subtraction
    \*) result=$(echo "$num1 * $num2" | bc -l) ;; # Multiplication (escaped '*' to avoid shell interpretation)
    /) 
      if [ "$num2" == "0" ]; then  # Check if the divisor is zero
        error_exit "Division by zero is not allowed."  # Trigger an error if dividing by zero
      fi
      result=$(echo "$num1 / $num2" | bc -l) ;;  # Division
    *) error_exit "Invalid operator. Please use one of: +, -, *, /." ;;  # Handle invalid operators
  esac
  # Output the result in a readable format
  echo "Result: $num1 $operator $num2 = $result"
}

# Prompt the user to enter the first number
# The input is stored in the variable 'num1'
read -p "Enter the first number: " num1

# Validate if the input for 'num1' is a valid number
if ! is_number "$num1"; then
  error_exit "Invalid input. Please enter a valid number."  # Exit if 'num1' is not a number
fi

# Prompt the user to enter the second number
# The input is stored in the variable 'num2'
read -p "Enter the second number: " num2

# Validate if the input for 'num2' is a valid number
if ! is_number "$num2"; then
  error_exit "Invalid input. Please enter a valid number."  # Exit if 'num2' is not a number
fi

# Prompt the user to enter the arithmetic operator (+, -, *, /)
# The input is stored in the variable 'operator'
read -p "Enter the operator (+, -, *, /): " operator

# Call the calculate function to perform the arithmetic operation
# This function also outputs the result
calculate
