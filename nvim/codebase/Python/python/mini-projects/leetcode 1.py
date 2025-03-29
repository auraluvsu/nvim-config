def process(num, t):
    print(num + 2 * t)

process(3, 2)

def isPalindrome(x):
    str_input = str(x)
    reverse_str = str_input[::-1]
    if str_input == reverse_str:
        return True
    else:
        return False
print(isPalindrome(12321))