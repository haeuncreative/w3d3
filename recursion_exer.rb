# <!-- Warmup
# Write a recursive method, range, that takes a start and an end and 
# returns an array of all numbers in that range, exclusive. For example, 
# range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return 
# an empty array.
require 'byebug'
def range(start, end_num)
    if end_num < start
        return []
    elsif start == end_num
        return [end_num]
    end

    range = [start] + range(start+1, end_num)

end

p range(1, 5)
p range(2, 20)
p range(-3, -6)
# Write both a recursive and iterative version of sum of an array.
def sum_array_i(arr)
    sum = 0
    arr.each {|ele| sum += ele }
    return sum
end

def sum_array_r(arr)
    return arr[0] if arr.length == 1
        
    sum = arr[0] + sum_array_r(arr[1..-1]) 
end
arr = [1,2,3]
arr2 = [70, 80, 90]
arr3 = [-10, -100, 70, 5]

p sum_array_i(arr)
p sum_array_r(arr)
p sum_array_i(arr2)
p sum_array_r(arr2)
p sum_array_i(arr3)
p sum_array_r(arr3)

# Exponentiation
# Write two versions of exponent that use two different recursions:

# def exp(b, n)
#     return 1 if n == 0
#     b * exp(b, n - 1)
# end

def exp(b, n)
    if n == 0
        return 1 
    elsif n == 1
        return b
    end

    even_exponent = exp(b, n/2)
    odd_exponent = exp(b, ((n - 1) / 2))
    if n.even?
        result = even_exponent * even_exponent
    else
        result = b * odd_exponent * odd_exponent
    end
       
    return result 

end


# this is math, not Ruby methods.

# recursion 1
p exp(2, 0) #= 1
p exp(2, 2)  #= b * exp(b, n - 1)
p exp(2, 3)
p exp(2, 5)
p exp(2, 9)

# Deep dup
# The #dup method doesn't make a deep copy:

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]


class Array
    def deep_dup
        if !self.instance_of?(Array) || self.length == 1
            return self
        end

        self.inject(Array.new) do |acc, el|
            if el.instance_of?(Array)
                acc << el.deep_dup
            else
                acc += [el]
            end
        end

        # cloned = Array.new
        # initial = self[0]
        # rest = self[1..-1]
        # if initial.instance_of?(Array)
        #     cloned = initial.deep_dup
        # else
        #     cloned << initial
        # end
        # cloned << self[1..-1].deep_dup
        # cloned
    end

end

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
robot_parts = ["capacitors", "resistors", "inductors", "LEDs"]
p copy = robot_parts.deep_dup
copy << 'eyes'
p 'robot_parts'
p robot_parts
p 'copy'
p copy
mixed = [1, [2], [3, [4]]]
p copy_2 = mixed.deep_dup

# When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.
def fibonacci(n)
    #seq = []
    if n == 0
        return [0]
    elsif n == 1
        return [0, 1]
    end

    fibonacci(n - 1) << fibonacci(n-1)[-2] + fibonacci(n-1)[-1]
    #seq << fib_num
    #return seq
end

# def sequence(n)
#     seq = Array.new
#     seq = [fibonacci(n-1)]
# end

p fibonacci(0)
p fibonacci(1)
p fibonacci(2)
#debugger
p fibonacci(10)

# You shouldn't have to pass any arrays between methods; you should be able 
# to do this just passing a single argument for the number of 
#Fibonacci numbers requested.

# Binary Search
# # The binary search algorithm begins by comparing the target value to 
# the value of the middle element of the sorted array. If the target value 
# is equal to the middle element's value, then the position is returned and 
# the search is finished. If the target value is less than the middle 
# element's value, then the search continues on the lower half of the 
# array; or if the target value is greater than the middle element's 
# value, then the search continues on the upper half of the array. 
# This process continues, eliminating half of the elements, and 
# comparing the target value to the value of the middle element of 
# the remaining elements - until the target value is either found 
# (and its associated element position is returned), or until the 
# entire array has been searched (and "not found" is returned).

# # Write a recursive binary search: p bsearch(array, target). Note that binary 
# search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:

def bsearch(arr, target)
    
    if arr.first == target
        return 0
    elsif arr.empty? #== 1
        return nil
    end

    # middle_index = 0
    # if arr.length.even?
    #     middle_index = arr.length / 2
    # else
    #     middle_index = (arr.length -  1) / 2
    # endv
    # if bsearch(arr[1..-1], target) == false
    #     return 1
    search = bsearch(arr[1..-1], target)
    if search != nil
        1 + search
    else
        search
    end

    # index += bsearch(arr[1..-1], target) 

    # if index-1 == arr.length 
    #     return nil
    # else
    #     index
    # end
end


p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# Merge Sort
# Implement a method merge_sort that sorts an Array:

def merge_sort(arr)
    if arr.length == 0
        return []
    elsif arr.length == 1
        return arr[0]
    end

    left = arr[0..arr.length / 2]
    right = arr[(arr.length / 2) + 1..-1]
    
    merge_sort(left) + merge_sort(right)
end

def merge(arr1, arr2)
    merge = Array.new
    if arr1[0] > arr2[0]
        merge << arr2[0]
        merge << arr1[0]
    elsif arr1[0] < arr2[0]
        merge << arr1[0]
        merge << arr2[0]
    end

end

# p merge_sort([6,5,3,1,8,7,2,4])
# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.
# Array p Subsets
# Write a method p subsets that will return all p subsets of an array.

def subsets(arr)


  return [[]] if arr.length == 0
  prev = subsets(arr[0..-2])
  others = prev.map { |subarr| subarr += [arr.last] }
  prev + others
end

# [1,2,3]
# [1,2] -> [1] -> [[]]
# prev = [[]]
# others = [[1]]
# [[], [1]]
# prev = [[], [1]]
# others = [[2], [1,2]]
# prev = [[], [1], [2], [1,2]]
# others = [[3], [1,3], [2,3], [1,2,3]]
# [[], [1], [2], [1,2], [3], [1,3], [2,3], [1,2,3]]

    # (0...arr.length).each do |i|
    #     (0...arr.length).each do |j|
    #         if j > i
    #             subsets(arr[1..-1])

    #             subs += arr[i..j]
    #         end
    #     end
    # end


    




# def subsets(arr)
#     # arr2 = Array.new {Array.new}
#     # arr.each do |ele|
#     #     arr2 << [ele]
#     subsets = [[]]
#     arr.each_with_index do |ele|
#         subsets << [ele]
#     end
    
#     arr.each_with_index do |ele, i|
#         (1...arr.length).each do |j|
#             if i < j
#                 subsets << arr[i..j]
#             end
#         end
#     end
#     subsets

# end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# debugger
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For p subsets([1, 2, 3]), there are two kinds of p subsets:

# Those that do not contain 3 (all of these are p subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset 
# that is the same, except it also does contain 3.
# Permutations
# Write a recursive method permutations(array) that calculates all the 
# permutations of the given array. 
# For an array of length n there are n! different permutations. 
# So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

def permutations(arr)
  return [[]] if arr.length == 0
  prev = subsets(arr[0..-2])
  others = prev.map { |subarr| subarr += [arr.last] }
  prev + others
end

def factorial
    
end


permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding 
# of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]
# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem. -->