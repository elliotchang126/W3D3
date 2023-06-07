def rec_range(min, max)
    return [] if max - 1 < min
    range(min, max - 1) + [max - 1]
end

def exp_1(b,n)
    return 1 if n == 0
    return b if n == 1
    exp_1(b,n-1) * b
end

def exp_2(b,n)
    return 1 if n == 0
    return b if n == 1
    if n.even?  
        exp(b, n / 2) * exp(b, n / 2) 
    else 
        b * (exp(b, (n - 1) / 2) ** 2)
    end
end

class Array

    def deep_dup
        return [] if self.empty?
        arr = []

        self.each do |ele|
            if ele.is_a?(Array)
                arr << ele.deep_dup
            else
                arr << ele
            end
        end
        arr
    end
end

def fib(n, memo = {})
    return [1, 1] if n == 2
    return [1] if n == 1
    return [] if n <= 0
    arr = fib(n-1, memo)
    memo[n] = fib(n-1, memo).last + fib(n-2, memo).last unless memo.has_key?(n)
    arr << memo[n]
end
require "byebug"
def bsearch(arr, target)
    return nil if arr.length == 1 && target != arr[0]

    middle_index = arr.length / 2
    # debugger
    if arr[middle_index] == target
        return middle_index
    elsif target > arr[middle_index]
        right_index = bsearch(arr[middle_index..-1], target)
        if right_index
            right_index + (arr.length / 2)
        end
    else
        bsearch(arr[0...middle_index], target)
    end
end

# left = arr[0...middle_index]
# right = arr[middle_index..-1]
# debugger
# if arr[middle_index] == target
#     return middle_index
# else
#     if left_index = bsearch(left, target)
#         return left_index if left[left_index] == target
#     else right_index = bsearch(right, target)
#         return right_index + left.length if right[right_index] == target
#     end
# end