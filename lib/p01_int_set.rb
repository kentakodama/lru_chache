class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    return false if @store[num]
    @store[num] = true
    true
  end

  def remove(num)
    raise "Out of bounds" unless is_valid?(num)
    return false unless @store[num]
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= @store.length && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20].push(num)
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store[num % 20].include?(num)
  end

  private

  def [](num)
    @store[]=(num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    if include?(num)
      false
    else
      @count += 1
      @store[num % 20].push(num)
      true
    end
  end

  def remove(num)
    if include?(num)
      @store[num % 20].delete(num)
      true
    else
      false
    end
  end

  def include?(num)
    @store[num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!

    old = @store
    @count = 0
    @store = Array.new(old.length * 2) { Array.new }
    old.flatten.each do |el|
      insert(el)
    end

  end
end
