require "prime"

def next_prime(n)
  while true
    n+=1
    if n.prime? then return n end
  end
end
