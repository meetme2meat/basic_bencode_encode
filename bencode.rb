class Array
  def bencode
    "l#{lookup}e"
  end

  def lookup
    self.map do |key|
      key.bencode
    end.join
  end
end

class Hash
  def bencode
    "d#{lookup}e"
  end

  def lookup
    sort.map do |key,value|
      [key.bencode,value.bencode]
    end.compact.join()
  end
end

class String
  def bencode
   "#{length}:#{self}"
  end
end

class Integer
  def bencode
    "i#{self}e"
  end
end


