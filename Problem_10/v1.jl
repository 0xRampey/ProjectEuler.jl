using BenchmarkTools

function sum_primes_below(n)
    sum = 0
    for i in 2:n-1
        if is_prime(i)
            sum += i
        end
    end
    return sum
end

function is_prime(num)
    # Every non-prime number will have atleast one factor <= its square root.
    # Check for it
    for i in 2:isqrt(num)
        if num % i == 0
            return false
        end
    end
    return true
end

@btime println(sum_primes_below(2000000))

# Resources
