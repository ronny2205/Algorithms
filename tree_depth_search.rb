# Tree depth search, using recursive

class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

    def depth_search(val)
    	return self if self.payload == val
    	found = nil
    	self.children.each do |child|
			found = child.depth_search(val)
			break if found 
		end
		return found
	end	

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

x = trunk.depth_search(6)
puts "----------"
puts x.inspect
