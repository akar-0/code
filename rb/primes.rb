# https://www.codewars.com/kata/5726f813c8dcebf5ed000a6b/solutions/ruby 

require "prime"

def next_prime(n)
  while true
    n+=1
    if n.prime? then return n end
  end
end
def factors(n)
  n=n.abs
  m=n
  if n.prime? then return [n] end
  p=2
  o=[]
  while n != 1 || p*p<m
    if n%p==0
      o.push(p)
      while n%p==0
        n/=p
      end
    end
    p=next_prime(p)
  end
  n==1 ? o : o + [n]
end
