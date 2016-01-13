# 1. If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_of_multiples
    sum = 0
    (1...1000).each do |num|
        sum += num if num % 3 == 0 || num % 5 == 0
    end
    sum
end

# 2. Each new term in the Fibonacci sequence is generated by adding 
# the previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed 
# four million, find the sum of the even-valued terms.

def fibonacci_sum
    fib_array = [1, 2]
    while fib_array.last < 4000000
        fib_array << fib_array[-1] + fib_array[-2]
    end
    fib_array.select{|num| num % 2 == 0}.inject(:+)
end

# 3. The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def helper(num)
    prime = true
    (2...num).each{|x| 
        prime = false if num % x == 0
        break if prime == false
    }
    prime
end

def largest_prime_factor(number)
    x = 2
    prime = []
    product = 1
    while product < number
        if ((number % x == 0) && (helper(x) == true))
            prime << x
            product *= x
        end
        x += 1
    end
    prime.last
end

#puts largest_prime_factor(13195)
#puts largest_prime_factor(600_851_475_143)

# 4. A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers 
# is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def factors(array)
    multiples = []
    array.each_with_index do |num, i|
        while i < array.length
            multiples << num * array[i]
            i += 1
        end
    end
    multiples
end
            
def palindromic
    palindrome_array = (998001.downto(10000)).to_a.select{|x| x == x.to_s.reverse.to_i}
    palindrome = []
    palindrome_array.each do |i|
        factor_array = (100..999).to_a.select{|x| i % x == 0}
        palindrome << i if factors(factor_array).include?(i)
        break if palindrome.length == 1
    end
    palindrome[0]
end
        
# puts palindromic

# 5. 2520 is the smallest number that can be divided by 
# each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly 
# divisible by all of the numbers from 1 to 20?

def least_common(a, b)
    lcm = a
    while (lcm % b != 0)
        lcm += a
    end
    lcm
end

def iterates(array)
    next_branch = []
    array.each_with_index do |num, i|
        break if array[i] == array.last
        next_branch << least_common(array[i], array[i + 1])
    end
    next_branch
end

def smallest_multiple
    factor_array = (1..20).to_a
    next_branch = iterates(factor_array)
    while next_branch.length > 1
        next_branch = iterates(next_branch)
    end
    next_branch[0]
end

# puts smallest_multiple

# 6. The sum of the squares of the first ten natural numbers is,
#   (1**2 + 2**2 + ... + 10**2) = 385
# The square of the sum of the first ten natural numbers is,
#   (1 + 2 + ... + 10)**2 = 55**2 = 3025
# Hence the difference between the sum of the squares of the first ten 
# natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the 
# first one hundred natural numbers and the square of the sum.

def sum_square_diff
    range = (1..100).to_a
    square = range.inject(:+) ** 2
    sum = range.map{|i| i ** 2}.inject(:+)
    square - sum
end

# puts sum_square_diff

# 7. By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
# we can see that the 6th prime is 13.
# What is the 10 001st prime number?


def find_prime(max, number)
    now = Time.now
    range = [0, 0, 2]
    (3..max).each do |num|
        num.odd? ? (range << num) : (range << 0)
    end
    i = range[3]
    while true
        (i*i).step(max, i) do |num|
            range[num] = 0
        end
        i = range.find{|num| (num > i)}
        break if i == nil
    end
    range = range.reject{|num| num == 0}
    puts range.join(",")
    puts range.length
    puts range[number - 1]
    puts "took #{Time.now - now} seconds"
end

#find_prime(105000, 10001)


# 8. Largest Product in a Series
# The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
# 73167176531330624919225119674426574742355349194934
# 96983520312774506326239578318016984801869478851843
# 85861560789112949495459501737958331952853208805511
# 12540698747158523863050715693290963295227443043557
# 66896648950445244523161731856403098711121722383113
# 62229893423380308135336276614282806444486645238749
# 30358907296290491560440772390713810515859307960866
# 70172427121883998797908792274921901699720888093776
# 65727333001053367881220235421809751254540594752243
# 52584907711670556013604839586446706324415722155397
# 53697817977846174064955149290862569321978468622482
# 83972241375657056057490261407972968652414535100474
# 82166370484403199890008895243450658541227588666881
# 16427171479924442928230863465674813919123162824586
# 17866458359124566529476545682848912883142607690042
# 24219022671055626321111109370544217506941658960408
# 07198403850962455444362981230987879927244284909188
# 84580156166097919133875499200524063689912560717606
# 05886116467109405077541002256983155200055935729725
# 71636269561882670428252483600823257530420752963450
# Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. 
# What is the value of this product?


def product(num)
    num = num.to_s.split("").map{|i| i.to_i}
    products = []
    num.each_with_index do |x, i|
        break if i > (num.length - 13)
        set = num[i..(i + 12)]
        products << set.inject(:*)
    end
    puts products.max
end
# number = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450
# product(number)

# 9. Special Pythagorean Triplet
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# =>    a2 + b2 = c2
# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def square_nums
    squares = []
    (1..1000).each{|num| squares << (num ** 2)}
    squares
end

def square_root(num)
    (1..(num / 2)).to_a.select{|x| x ** 2 == num}[0]
end

def pythagoreans
    potentials = square_nums
    pythagorean = []
    
    potentials.each_with_index do |a_sq, i1|
        i2 = i1 + 1
        while i2 < (potentials.length - 1)
            i3 = i2 + 1
            b_sq = potentials[i2]
            while i3 < (potentials.length)
                c_sq = potentials[i3]
                if a_sq + b_sq == c_sq
                    pythagorean << [a_sq, b_sq, c_sq]
                end
                i3 += 1
            end
            i2 += 1
        end
    end
    pythagorean
end

def adding_up_square_roots(pythagoreans)
    pythagoreans.each do |combo|
        a = square_root(combo[0])
        b = square_root(combo[1])
        c = square_root(combo[2])
        if (a + b + c) == 1000
            puts (a * b * c)
            break
        end
    end
end

#adding_up_square_roots(pythagoreans)

# 10. Prime summation
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
#
# Even though I managed to create a sieve of Eratosthenes as part of
# my solution, it doesn't solve the problem fast enough. There's an element
# that's missing.
# Update - figured it out! I made the while loop break if the square of i was
# greater than the length of the range. Not seeing it before feels so silly. 

def get_range(max)
    range = [0, 0, 2]
    (3..max).each do |num|
        num.odd? ? (range << num) : (range << 0)
    end
    range
end

def sum_of_primes(max)
    now = Time.now
    range = get_range(max)
    i = range[3]
    while true
        (i*i).step(max, i) do |num|
            #puts "i is #{i}, num is #{num}"
            #puts range.join(",")
            range[num] = 0
        end
        #i = range.find{|number| number > i} #regular search, time = 0.96
        i = range.bsearch {|number| (number > i)} #bsearch, time = 0.64
        break if i*i > (range.length)
    end
    #puts "primes are #{range.select{|num| num > 0}.join(",")}"
    puts range.inject(:+)
    puts (Time.now - now)
end

#puts sum_of_primes(100) # should == 1060
#puts sum_of_primes(1000) # should == 76,127
puts sum_of_primes(2000000) # should == 142913828922