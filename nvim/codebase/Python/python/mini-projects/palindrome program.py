import string

while True:
    user_input = input(str("Enter a word or sentence: \n"))
    if not user_input:
        print("You must enter a valid word or sentence! \n")
        continue
    user_string = user_input.lower()
    no_punc_string = user_string.translate(str.maketrans('', '', string.punctuation + " "))
    if not no_punc_string:
        print("Your input contains no valid characters to check! Try again.\n")
        continue
    reversed_string = no_punc_string[::-1]
    if reversed_string == no_punc_string:
        print("Congratulations your string is a palindrome")
    else:
        print("Aww your string is not a palindrome")
    try_again = input("Would you like to try again? (yes/no) \n").lower()
    if try_again != 'yes':
        print('Goodbye!')
        break