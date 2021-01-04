#!/usr/bin/python3

import random


password_chars = {
    "1": "0123456789",
    "2": "abcdefghijklmnopqrstuvwxyz",
    "3": "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "4": "~!@#$%^&*()?_",
}

info = """Choose option number, can multiple choice
1. Number
2. Lowercase
3. Uppercase
4. Symbols
"""


if __name__ == "__main__":
    print(info)
    option = input("Options => ")
    pass_len = input("Password Length => ")
    chars = ""
    for x in option.split(" "):
        chars += password_chars[x]
    result = ""
    chars_len = len(chars)
    for i in range(int(pass_len)):
        result += chars[random.randint(0, chars_len)]
    print("password is")
    print(result)
