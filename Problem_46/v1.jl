using BenchmarkTools
include("../utils.jl")

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
        # Overhead to cache repeat prime number values is more than the computation itself
        # So no point memoizing
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

@btime println(main())

# Resources
