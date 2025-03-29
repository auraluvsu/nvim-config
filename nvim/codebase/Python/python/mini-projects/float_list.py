import random

list = []
for i in range(0, 6):
    arr = float(random.uniform(0, 1))
    new_arr = round(arr, 4)
    list.append(new_arr)

print(list)