
def decode(str)
  while(!str.empty?)
    if str[0] == 'i'
      idx = str.index('e')
      raise 'Invalid' unless idx
      new_str = str.slice!(0,idx+1)
      return new_str[1..-1].to_i
    elsif str[0] == 'l'
      results = []
      new_str = str[1...-1]
      str.slice!(0)
      str.gsub!(new_str,'')
      results << decode(new_str) until !new_str.empty?
      str.slice!(0)
      return results
    elsif str[0] == 'd'
      raise "Invalid" unless str.slice!(0) == 'd'
      results = []
      results << [decode(str),decode(str)] until str[0] != 'e'
      str.slice!(0)
      return Hash[results]
    elsif str[0] =~ /\d/
      idx = str.index(':')
      raise 'Invalid' unless idx
      length = str.slice!(0,idx).to_i
      raise 'Invalid' unless str.slice!(0) == ':'
      return str.slice!(0...length)
    end
  end
end

puts decode("d9:[1, 2, 3]3:onee").inspect
