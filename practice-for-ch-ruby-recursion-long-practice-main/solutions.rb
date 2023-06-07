def rec_range(min, max)
    return [] if max - 1 < min
    range(min, max - 1) + [max - 1]
end

