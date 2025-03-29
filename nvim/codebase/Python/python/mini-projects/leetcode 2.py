def twoSum(nums, target):
    for i in nums:
        if i > target:
            print('Error!')
        else:
            target -= i
    return target, i

print(twoSum([2,6,11,15], 9))
        