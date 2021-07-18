using BenchmarkTools
include("../utils.jl")

function check_n_distinct_primes(n, number)
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
    # For n=4 => [3,4,5,6]
    first = 3
    while true
        # Check disitnct primes starting from last element of the set
        for i in (first + n - 1):-1:first
            if check_n_distinct_primes(n, i)
                if i == first
                    # We found our numbers
                    return first
                end
            else
                # Try the next set of numbers
                # Reset first elemnt of set to latest failed check + 1
                first = i+1
                break
            end
        end
    end
end

@btime println(n_ints_with_n_distinct_primes(4))

# Resources
