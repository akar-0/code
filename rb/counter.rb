count=Hash.new {|h, key| h[key]=0}
a.each{|x| count[x]+=1}
