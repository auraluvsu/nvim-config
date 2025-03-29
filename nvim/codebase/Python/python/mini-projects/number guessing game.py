import random

# Choose random number
x = random.randint(1, 100)

print("Welcome to the Number guessing game \n")

# Set the attempts number to 0
count = 0
while True:
    guess = int(input("Enter your guess: \n"))
    count += 1 # Change attempt count by 1 for every input
    if guess > x:
        print("Too High! Try again: \n")
    elif guess < x:
        print("Too low! Try again: \n")
    elif guess == x:
        print(f"Congratulations! You guessed the number in {count} attempts!")
        try_again = input("Would you like to try again? (yes/no) \n").lower()
        if try_again != 'yes':
            break
        else:
            x = random.randint(1, 100) # Chooses new random number
            count = 0 # Resets attempts to 0