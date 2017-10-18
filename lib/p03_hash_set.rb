require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    if include?(key)
      false
    else
      @count += 1
      @store[key.hash % 8].push(key)
      true
    end
  end

  def include?(key)
    @store[key.hash % 8].include?(key)
  end

  def remove(key)
    if include?(key)
      @store[key.hash % 8].delete(key)
      true
    else
      false
    end
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
