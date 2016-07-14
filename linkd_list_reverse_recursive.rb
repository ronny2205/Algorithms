# Recursive solution for reversing a linked list

class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


def print_values(list_node)
  if list_node.nil?
    print "nil\n"
  else
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  end 
end

def reverse_list(list, previous=nil)
  return previous if list.nil?
  next_element = list.next_node
  list.next_node = previous
  reverse_list(next_element, list)
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(55, node3)

print_values(node4)

puts "-------"

revlist = reverse_list(node4)

print_values(revlist)


# Tests
gem 'minitest'
  require 'minitest/autorun'

  class TestReverseList < MiniTest::Test

    def test_reverse_works
      node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(99, node1)
    node3 = LinkedListNode.new(12, node2)
    rev_list = reverse_list(node3)
    assert_equal 37, rev_list.value
    assert_equal 99, rev_list.next_node.value
    assert_equal 12, rev_list.next_node.next_node.value
    assert_equal nil, rev_list.next_node.next_node.next_node
    end 

  end
