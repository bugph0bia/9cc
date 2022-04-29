#!/bin/bash
assert() {
    expected="$1"
    input="$2"

    ./9cc "$input" > tmp.s
    cc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expected expected, but got $actual"
        exit 1
    fi
}

# 数値
assert 0 0
assert 42 42
# 算術演算 + - * / ( )
assert 21 "5+20-4"
assert 41 " 12 + 34 - 5 "
assert 47 "5+6*7"
assert 15 "5*(9-6)"
assert 4 "(3+5)/2"
assert 93 "(39-(4+18/2))+67"
# 単項 + -
assert 10 "-(-10)"
assert 5 "+2+3"
# 比較演算
assert 1 "5 < 6"
assert 0 "6 < 6"
assert 0 "7 < 6"
assert 1 "5 <= 6"
assert 1 "6 <= 6"
assert 0 "7 <= 6"
assert 0 "5 > 6"
assert 0 "6 > 6"
assert 1 "7 > 6"
assert 0 "5 >= 6"
assert 1 "6 >= 6"
assert 1 "7 >= 6"
assert 0 "5 == 6"
assert 1 "6 == 6"
assert 0 "7 == 6"
assert 1 "5 != 6"
assert 0 "6 != 6"
assert 1 "7 != 6"

echo OK

