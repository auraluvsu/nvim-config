import math
pi = math.pi
class linearOps:
    def add(x, y):
        return x + y
    def subtract(x, y):
        return x - y
    def multiply(x, y):
        return x * y
    def divide(x, y):
        return x / y
    def floor_division(x, y):
        return x // y
    def exponentiation(x, y):
        return pow(x, y)
    def squareroot(x):
        return math.sqrt(x)   
class twoDim:
    def circle_area(x):
        return math.pi * (x**2)
    def baseheight(x, y):
        return x * y
    def square_area(x):
        return x ** 2
    def trapezoid_area(x, y, z):
        return ((x + y) / 2) * z
    def triangle_area(x, y):
        return (x * y) / 2
class threeDim:
    def sphere_surface(r):
        return 4 * pi * (r**2)
    def sphere_volume(r):
        return (4/3) * pi * (r**3)
    def cube_surface(a):
        return 6 * (a**2)
    def cube_volume(a):
        return a**3
    def pyramid_volume(a, b, c):
        return (a*b*c)/3
    def cylinder_surface(r, h):
        return (2*pi*r*h) + (2*pi*(r**2))
    def cylinder_volume(r, h):
        return pi * (r**2) * h
class trigFunc:
    def angle_to_rad(angle):
        return angle * (pi/180)
    def sin(rad):
        sinconst = math.sin(rad)
        return sinconst
    def cos(rad):
        cosconst = math.cos(rad)
        return cosconst
    def tan(rad):
        tanconst = math.tan(rad)
        return tanconst
    def sine_rule(side, rad1, rad2):
        return side * (trigFunc.sin(rad1) / trigFunc.sin(rad2))
    def cosine_rule(a, b, g):
        return math.sqrt((a**2)+(b**2)-(2*(a*b))*trigFunc.cos(g))
    def pythagoras(a, b):
        return (a**2) + (b**2)
