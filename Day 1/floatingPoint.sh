#!/bin/bash
## floating point operations in bash
## sum
echo "3.9 + 8.2 = " $(echo 3.9 + 8.2 | bc)
## multiply
echo "6.9 * 5.5 = " $(echo 6.9 \* 5.5 | bc)
## division
echo "8.0 // 1.5 = " $(echo 8.0 / 1.5 | bc)


