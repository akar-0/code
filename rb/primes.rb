# https://www.codewars.com/kata/5726f813c8dcebf5ed000a6b/solutions/ruby 

require "prime"

def next_prime(n)
  while true
    n+=1
    if n.prime? then return n end
  end
end
