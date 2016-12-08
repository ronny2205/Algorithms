class Stack
	def initialize
		@stack = []
	end

	def length
		@stack.length
	end

	def empty?
		@stack.length == 0
	end

	def push(item)
		@stack.push(item)
	end

	def pop
		@stack.pop
	end

	def top
		@stack[@stack.length-1]
	end

	def print_stack
		while !@stack.empty?
			puts self.pop
		end
	end

	def sort
		tmp_stack = Stack.new
		tmp = self.pop
		while !self.empty?
			if tmp_stack.empty? || tmp_stack.top > tmp
				tmp_stack.push(tmp)
				tmp = self.pop
			else
				self.push(tmp_stack.pop)
			end
		end
		tmp_stack.push(tmp)
		tmp_stack
	end
end
