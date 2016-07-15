# Detection of cycles within a linked list, using Floyd’s algorithm. (Checking whether the list is infinite)

gem 'minitest'
require 'minitest/autorun'


class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end
 
def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def is_infinite(list)
  p1 = list
  p2 = list

  while true
    if p2.nil? 
      return false
    end
    p2 = p2.next_node
    if p2.nil? 
      return false
    end 
    if p1 == p2 
      return true
    end 
    p1 = p1.next_node
    p2 = p2.next_node
    return true if p1 == p2 
  end 
end  
 
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3


x = is_infinite(nil)
puts x


class TestInfiniteList < MiniTest::Test

    def test_infinite_works
      node1 = LinkedListNode.new(37)
      node2 = LinkedListNode.new(99, node1)
      node3 = LinkedListNode.new(12, node2)
      node1.next_node = node3


      node4 = LinkedListNode.new(67)
      node5 = LinkedListNode.new(83, node4)
      node6 = LinkedListNode.new(11, node5)
      
      assert_equal true, is_infinite(node3)
      assert_equal true, is_infinite(node2)
      assert_equal false, is_infinite(node4)
      assert_equal false, is_infinite(nil)
    end 

  end 
