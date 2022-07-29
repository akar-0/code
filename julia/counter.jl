  counter = Dict{Char, Int}()
  for c in lowercase(s)
    if haskey(counter, c)
      counter[c] += 1
    else
      counter[c] = 1
    end
  end
