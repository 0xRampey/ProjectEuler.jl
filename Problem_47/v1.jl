using BenchmarkTools
using Memoize
include("../utils.jl")

@memoize function check_n_distinct_primes(n, number)
    count = 0
    for i = 2:number
        if number % i == 0 && is_prime(i)
            count += 1
        end
        if count == n
            return true
        end
    end
    return false
end

function n_ints_with_n_distinct_primes(n)
    # Let first set start with 3
    first = 3
    while true
        next = first
        # Check disitnct primes for each of the n numbers of the set
        for i = 1:n
            if check_n_distinct_primes(n, next)
                if next - first == n - 1
                    # We found our numbers
                    return first
                else
                    # Check for next consecutive number
                    next += 1
                end
            else
                # Try  a different set of numbers
                break
            end
        end
        first += 1
    end
end

@time println(n_ints_with_n_distinct_primes(4))

# Resources
