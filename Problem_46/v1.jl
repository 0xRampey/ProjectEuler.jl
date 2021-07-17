using BenchmarkTools

function perfect_square(n)
    root = sqrt(n)
    # Check if any residual decimals present
    return root == trunc(root) ? true : false
end

function check_conjecture(n)
    if is_prime(n)
        # Don't bother, this only for composites
        return true
    end
    # find all primes lesser than the number
    for i in 2:(n-2)
        if is_prime(i)
             # Subtract them from number
            square = (n - i)/2
            if perfect_square(square)
                return true
            end
        end
    end
    return false
end

function main()
    n = 35
    while check_conjecture(n)
        n += 2
    end
    return n
end

# Overhead to store memoized values is more than the computation itself
# So no point memoizing
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

@btime println(main())

# Resources
