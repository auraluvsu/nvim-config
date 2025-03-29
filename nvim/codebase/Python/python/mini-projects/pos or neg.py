
while True:
    try:
        print("\n")
        x = int(input("Input Number Here: "))
        if x > 0:
            print("The number is positive \n")
        elif x < 0:
            print("The number is negative \n")
        else:
            print("The number is 0 \n")
        if x % 3 == 0 and x % 5 == 0:
            print("The number is divisible by 3 and 5 \n")
        elif x % 5 == 0:
            print("The number is divisible by 5 \n")
        elif x % 3 == 0:
            print("The number is divisible by 3 \n")
        else:
            print("The number is not divisible by 3 or 5 \n")
            continue
        y = input("would you like to play again? (yes/no): ").lower()
        if y != 'yes':
            print("Goodbye")
            break
    except ValueError:
        print("Invalid Number! \n")