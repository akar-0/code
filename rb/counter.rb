counter=Hash.new {|h, key| h[key]=0}     // Hash(0) ???
a.each{|x| counter[x]+=1}
