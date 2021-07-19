# using BenchmarkTools

function is_prime(num)
    # Every non-prime number will have atleast one factor <= its square root.
    # Just need to find that
    for i = 2:isqrt(num)
        if num % i == 0
            return false
        end
    end
    return true
end

function get_prime_sieve_to_n(n)
    # Assume all to be prime and unmarked
    # false means marked or not prime
    sieve = trues(n)
    sieve[1] = false 
    for idx in 2:isqrt(n)
        # If index is true, it is prime
        if sieve[idx]         
            # Mark its multiples to be not prime
            for i in 2:floor(Int64, (n / idx))
                sieve[i * idx] = false
            end
        end
    end
    return sieve
end

# @time println(findall(get_prime_factor_sieve_to_n(100)))
# Module and import system in Julia has quite the learning curve.
# Definitely not user friendly.