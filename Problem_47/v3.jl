using BenchmarkTools

# Using the sieve approach where multiples that are 'marked' n times
# must each have number of unique prime factors equal to n
# Then find the first set of consecutive multiples
function n_ints_with_n_distinct_primes(n)
    limit = 1000000
    sieve = zeros(limit)
    count = 0
    for i in 2:limit
        if sieve[i] == 0
            # Must be prime
            count=0         
            multiple = i
            # Increment all multiples that share the same factor 
            while multiple < limit
                sieve[multiple] += 1
                multiple += i
            end
        elseif sieve[i] == n
            # Found a number with n unique factors
            count += 1
            if count == n
                # Found n such numbers
                # Return first number
                return i - (n-1)
            end
        else
            # Reset count 
            count = 0
        end
    end
    return 0
end


@btime println(n_ints_with_n_distinct_primes(4))

# Resources
