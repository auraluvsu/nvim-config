import math
def meter_conversion(cm):
    return cm / 100
def kilometer_conversion(m):
    return m / 100000
def sphere_surface(r):
    pi = math.pi
    return 4 * pi * (r**2)


while True:
    try:
        rad = float(input('Enter The Radius(cm): \n'))
        if rad < 0:
            print('Error, please input a positive number: \n')
            continue
        else:
            solutionflt = sphere_surface(rad)
            if solutionflt > 100 and solutionflt < 100000:
                solution_meters = meter_conversion(solutionflt)
                solution2 = round(solution_meters, 3)
                solution = str(solution2)+ ' M'
            elif solutionflt >= 100000:
                solution_kilometers = kilometer_conversion(solutionflt)
                solution2 = round(solution_kilometers, 3)
                solution = str(solution2) + ' KM'
            else:
                solution = round(solutionflt, 2)
            print(f"Your sphere's surface is: {solution} \n")
        try_again = str(input("Input another radius? \n")).lower()
        if try_again == 'no':
            print("Goodbye!")
            break
    except ValueError:
        print("Invalid! \n")
        continue