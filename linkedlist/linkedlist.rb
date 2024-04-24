class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if head.nil?
      @head = new_node
    end
    if tail.nil?
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node

  end
  def size
    counter = 0
    current_node = @head

    until current_node.nil?
      counter +=1
      current_node = current_node.next_node

    end
    counter
  end

  def head
    @head

  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    nil if size < 1
    current_node = @head
    until current_node.next_node == @tail
      current_node = current_node.next_node
    end
    current_node.next_node = nil
    @tail = current_node

  end

  def contains?(value)
    current_node = @head
    contains = false

    until current_node.nil?
      if current_node.data == value
        contains = true
      end
        current_node = current_node.next_node
      end
      contains

  end

  def find(value)
    current_node = @head
    index = 0
    found = false

    until current_node.nil?
      if current_node.data == value
        found = true
        return index
      else
        index +=1
        current_node = current_node.next_node
      end

    end
    found
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "( #{current_node.data} ) -> "
      current_node = current_node.next_node

    end


  end


end

class Node
  attr_accessor :next_node, :data
  def initialize (data = nil, next_node = nil)
    @next_node = next_node
    @data = data
  end
end

my_list = LinkedList.new
p my_list
my_list.append('last')
p my_list
my_list.prepend('first')
p my_list.to_s
puts "Size: #{my_list.size}"
puts "Head: #{my_list.head.data}"
puts "Tail: #{my_list.tail.data}"
puts "At 1: #{my_list.at(1).data}"
p my_list.find('first')
p my_list.contains?('hiu')
my_list.pop
p my_list.to_s
