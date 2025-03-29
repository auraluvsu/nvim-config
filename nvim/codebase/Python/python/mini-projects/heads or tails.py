import random


while True:
    heads = 0
    tails = 0
    flip2 = str(input('How many flips? \n')).lower()
    if flip2 == 'no':
        break
    flip = int(flip2)
    flip3 = flip
    while flip > 0:
        prob = random.randint(0,100)
        if prob > 50:
            print('Heads \n')
            heads +=1
        else:
            print('Tails \n')
            tails +=1
        print(f'Heads = {heads}')
        print(f'Tails = {tails}')
        flip -=1

    def percentage():
        heads_percent = round(((heads / flip3) * 100), 1)
        tails_percent = round(((tails / flip3) * 100), 1)
        heads_str = str(heads_percent)
        tails_str = str(tails_percent)
        print(f'{tails_percent}% Tails, {heads_str}% Heads')
    percentage()