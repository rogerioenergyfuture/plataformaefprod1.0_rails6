
  character_set = ["0".."9"]
  len=6
  chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
  puts Array.new(len){ chars.sample }.join