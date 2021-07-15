using BenchmarkTools

function get_nth_prime(n)
	rank = 1
    i = 2
	while rank < n
    	i+=1
		if is_prime(i)
	  		rank+=1
		end
	end
	return i
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

@btime println(get_nth_prime(10001))

# Resources
