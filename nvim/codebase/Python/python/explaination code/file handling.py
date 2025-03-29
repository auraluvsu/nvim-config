import os

#Overwrite text
f = open(r"C:\Users\ntrea\Documents\oogaabooga.txt", "w")
f.write("Hello World \n")
f.close()

#Append text
f = open(r"C:\Users\ntrea\Documents\oogaabooga.txt", "a")
f.write("I'm watching you xo")
f.close()

#Read file
f = open(r"C:\Users\ntrea\Documents\oogaabooga.txt", "r")
print(f.read())
f.close()

#Delete file
if os.path.exists(r"C:\Users\ntrea\Documents\oogaabooga.txt"):
    os.remove(r"C:\Users\ntrea\Documents\oogaabooga.txt")
else:
    print("This file doesn't exist")