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

def bsearch(arr, target)
    return nil if arr.length == 1 && target != arr[0]

    middle_index = arr.length / 2
    
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

def merge(arr1, arr2)
    res = []
    loop do
        if arr1[0] < arr2[0]
            res << arr1.shift
        else
            res << arr2.shift
        end
        break if arr1.empty? || arr2.empty?
    end
     res + arr1 + arr2
end

def merge_sort(arr)
    return arr if arr.length <= 1
    middle_index = arr.length / 2
    arr1 = arr[0...middle_index]
    arr2 = arr[middle_index..-1]
    merge(merge_sort(arr1), merge_sort(arr2))
end

def subsets(arr)
    return [[]] if arr == []
    return [[], arr] if arr.is_a?(Integer)
    # arr.map do |ele|
    #     subsets(ele)
    # end
    res = subsets(arr[0...-1])
    new_arr = subsets(res).map { |ele| ele << arr[0] }
    res + new_arr

    # copy = new_arr.map { |ele| ele << arr.shift}
    # new_arr << arr.shift
    # new_ arr = subsets(new_arr) + copy
end