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

