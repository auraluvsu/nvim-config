while True:
    num = int(input('Enter a number: \n'))
    for i in range(2, num):
        if (num % i) == 0:
            print(f'The number is divisible by {i} \n')
            break
    else:
        print('Prime number \n')

    try_again = str(input('New number? \n')).lower()
    if try_again != 'yes':
        print('Goodbye!')
        break