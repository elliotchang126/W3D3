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



