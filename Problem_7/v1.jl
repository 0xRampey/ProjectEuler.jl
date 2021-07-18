using BenchmarkTools
include("../utils.jl")

function get_nth_prime(n)
    rank = 1
    i = 2
    while rank < n
        i += 1
        if is_prime(i)
            rank += 1
        end
    end
    return i
end

@btime println(get_nth_prime(10001))

# Resources
