using BenchmarkTools

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

@btime println(max_prime(600851475143))

# Resources
# https://projecteuler.net/thread=3
