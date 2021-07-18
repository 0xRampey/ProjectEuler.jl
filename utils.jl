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

# Module and import system in Julia has quite the learning curve.
# Definitely not user friendly.