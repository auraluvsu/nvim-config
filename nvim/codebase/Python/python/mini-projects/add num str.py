while True:
    x = str(input("Place your number here: \n"))
    y = list(x)
    new_list = [int(n) for n in y]
    final_variable = sum(new_list)
    print(final_variable)
    try_again = input("Play again? \n").lower()
    if try_again != 'yes':
        break