# Tree breadth search, using a queue
class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(item)
        @queue.push(item)
    end

    def dequeue
        @queue.shift
    end

    def top
    	@queue[0]
    end	

    def empty?
    	if @queue.any?
    		return false
    	else
    		return true
    	end	
    end	
end

def breadth_search(tree, val)
    	
	queue = Queue.new
 	queue.enqueue(tree)

 	return val if queue.top.payload == val
 	result = []
 		
 	while (!queue.empty? && queue.top.payload != val)
 		result.push(queue.top.payload)
 		parent = queue.dequeue
 			
 		parent.children.each do |child|
	 		queue.enqueue(child)
	 	end		
 	end
 	if !queue.empty? 
 		result.push(queue.top.payload)
 	end
 	result	
end	


# The "Leaves" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

x = breadth_search(trunk, 11)
puts "----------"
puts x.inspect
