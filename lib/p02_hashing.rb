class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    str = ''
    self.each_with_index do |el, i|
      str += (el.to_s + i.to_s)
    end
    str.to_i.hash
  end
end

class String
  def hash
    self.split('').map(&:ord).join('').to_s.split('').hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = self.to_a.sort.flatten.map do |el|
      el.to_s.ord
    end
    array.hash
  end
end
