while True:
    try:
        user_input = input(str("Enter a sentence: \n"))
        string_length = sum(not chr.isspace()for chr in user_input)
        word_counter = user_input.split()
        word_list = len(word_counter)
        res = max(word_counter, key=len)
        print(f"Longest word: {res} \n")
        print(f"Total characters (excluding spaces): {string_length} \n")
        print(f"Total words: {word_list}")
        y = input("Would you like to try again? (yes/no) \n")
        if y != 'yes':
            print("Shutting down...")
            break
    except Exception as e:
        print(f'An error occureds  {e}')