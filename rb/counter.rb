  count=Hash.new {|h, key| h[key]=0}
  a.each{|x| count[x]+=1}
# https://www.codewars.com/kata/reviews/5865355c02698c58e4000175/groups/5a66da2374df2abfcb000b8a
# crystal
  count=Hash(Int32, Int32).new(0)
