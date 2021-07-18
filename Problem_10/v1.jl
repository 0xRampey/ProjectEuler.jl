using BenchmarkTools
include("../utils.jl")

function sum_primes_below(n)
    sum = 0
    for i in 2:n-1
        if is_prime(i)
            sum += i
        end
    end
    return sum
end

@btime println(sum_primes_below(2000000))

# Resources
