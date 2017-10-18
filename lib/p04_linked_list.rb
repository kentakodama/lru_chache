class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.

      previous = self.prev
      subsequent = self.next
      previous.next = subsequent
      subsequent.prev = previous

  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if node.key == key }

  end

  def include?(key)
    each { |node| return true if node.key == key }
    return false
  end

  def append(key, val)
    prev = @tail.prev
    new_node = Node.new(key, val)
    prev.next = new_node
    new_node.prev = prev
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
      end
    end
    nil
  end

  def each
    current = @head.next
    until current == @tail
      yield(current)
      current = current.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
