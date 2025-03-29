while True:
    num = (input('Enter a decimal number: \n'))
    numflt = float(num)
    numint = int(numflt)
    if numflt % numint != 0:
        print('It is a float')
        decimal = numflt - numint
        print(f'The decimal is: {decimal}')
    else:
        print('It is not a float')