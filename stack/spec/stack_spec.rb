require "stack"

describe Stack do
	describe "initialize a new stack" do
	  it "should have length of 0" do		
		s = Stack.new	
		expect(s.length).to eql(0)
	  end
	end

	describe "#empty" do 
	  it "should be empty" do
	  	s = Stack.new
	  	expect(s.empty?).to eql(true)
	  end

	  it "shouldn't be empty" do
	  	s = Stack.new
	  	s.push(5)
	  	expect(s.empty?).to eql(false)
	  end
	end

	describe "#push" do
		it "pushes one item to the stack" do
		  s = Stack.new	
		  s.push(5)
		  expect(s.length).to eql(1)
		end

		it "pushes two items to the stack" do
		  s = Stack.new	
		  s.push(5)
		  s.push(7)
		  expect(s.length).to eql(2)
		end
	end
	
	describe "#pop" do
		it "pops an item from the stack" do
		  s = Stack.new	
		  s.push(5)
		  s.push(7)
		  s.pop
		  expect(s.length).to eql(1)
		end

		it "returnd the poped item" do
		  s = Stack.new	
		  s.push(5)
		  s.push(7)
		  expected = s.pop
		  expect(expected).to eql(7)
		end
	end

	describe "#top" do
		it "should return the top item" do
		  s = Stack.new	
		  s.push(9)
		  expected = s.top
		  expect(expected).to eql(9)
		end

		it "should have the same length afetr top" do
		  s = Stack.new	
		  s.push(9)
		  s.top
		  expect(s.length).to eql(1)
		end
	end

	describe "#sort" do
	  it "should sort the stack1" do	
		  s = Stack.new	
		  s.push(2)
		  s.push(4)
		  sorted_stack = s.sort

		  expected_arr = []
		  while !sorted_stack.empty?
		  	expected_arr.push(sorted_stack.pop)
		  end

		  expect(expected_arr).to eql([2, 4])

	  end

	  it "should sort the stack2" do	
		  s = Stack.new	
		  s.push(1)
		  s.push(4)
		  s.push(2)
		  s.push(7)
		  s.push(6)
		  s.push(24)
		  s.push(5)
		  sorted_stack = s.sort

		  expected_arr = []
		  while !sorted_stack.empty?
		  	expected_arr << sorted_stack.pop
		  end

		  expect(expected_arr).to eql([1, 2, 4, 5, 6, 7, 24])
	  end
	end
end
