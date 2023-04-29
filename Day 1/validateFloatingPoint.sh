#!/bin/bash
## Script accepts two floating point numbers from command line as parameters, and prints out their division result
## Parameters
## 1st parameter: 1st floating point number
## 2nd parameter: 2nd floating point number
## Exit codes
## 0: Success
## 1: Not enough parameters
## 2: Division by zero
## 3: NUM1 is not a number
## 4: NUM2 is not a number

## Check for parameters
[ ${#} -ne 2 ] && exit 1

## Assign values to custom variables
NUM1=${1}
NUM2=${2}

## Check for floating point values
echo "${NUM1}" | grep -Eq "^[+-]?[0-9]*\.[0-9]+$" || exit 3
echo "${NUM2}" | grep -Eq "^[+-]?[0-9]*\.[0-9]+$" || exit 4

## Check for division by zero
if (( $(echo "${NUM2} == 0" | bc -l) )); then
  exit 2
fi

## Perform division operation using bc command
RES=$(echo "scale=2; ${NUM1}/${NUM2}" | bc)

## Prints out the result
echo "Division = ${RES}"

exit 0
