
def passed(grade):

    if grade < 1:
        print("Error! please enter a positive number. \n")

    if grade > 100:
        print('Error! Grades can only be between 1 and 100. \n')

    if grade in range(90, 100):
        print('A*')
    elif grade in range(80, 90):
        print('A')
    elif grade in range(70, 80):
        print('B')
    elif grade in range(60, 70):
        print('C')
    elif grade in range(50, 60):
        print('D')
    else:
        print('F')
    return grade


grade = int(input('Please enter your grade here: \n'))
passed(grade)