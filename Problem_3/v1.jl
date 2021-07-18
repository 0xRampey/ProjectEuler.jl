using BenchmarkTools
include("../utils.jl")

function max_prime(num)
    max = 1
    i = 2
    while i <= num
        # Check if number prime odd, divisible and prime
        if num % 2 != 0 && num % i == 0 && is_prime(i)
            # Divide number with prime factor to decrease computation load
            # Huge perf boost
            num /= i
            max = i > max ? i : max
            # println(max)
            # println(num)
        end
        i += 1
    end
    return max
end

@btime println(max_prime(600851475143))

# Resources
# https://projecteuler.net/thread=3
