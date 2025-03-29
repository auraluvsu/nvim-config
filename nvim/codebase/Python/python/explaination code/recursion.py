def recursion(n):
    if n == 1:
        return 1
    else:
      result = n * recursion(n-1)
      print(result)
    return result

recursion(100)