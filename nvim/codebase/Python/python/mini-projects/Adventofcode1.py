with open(r"C:/Program Files/Neovim/bin/code2/Python/python/mini projects/adventOfCodeDay1.txt", "r") as file:
    line = file.readline().strip()
    data = line.split(" ")

    array1 = []
    array2 = []
    
    for i in data:
        if data.index(i) % 2 == 0:
            array2.append(i)
        else:
            array1.append(i)

print(array1[0:10])
