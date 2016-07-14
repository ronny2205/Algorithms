 # A method that flattens an array of arbitrarily nested arrays of integers into a flat array of integers
  # The method assumes that all the elements in the array are integers
  
  def flatten(arr, flatten_arr=[])
     # Looping through all the elements of the given array    
     arr.each do |elem|
        # If the element is an array, the function calls itself recursevly and flattens the sub-array
        if elem.class == Array
          flatten(elem,flatten_arr)
        # If the element is integer, we push it to the flatten array    
        else
          flatten_arr.push(elem)
        end 
     end   
     # Returning the flattened array
     flatten_arr
  end  


# Unit tests
require 'minitest/autorun'

class TestFlatten < Minitest::Test

  def test_flatten
    assert_equal  [1,2,3,5,6,7], flatten([1,2,[3,5],6,[7]])
  end

  def test_flatten2
    arr = [[1],2,[3,4,[5,6,7]],8, [9,10,[11,12,[13,14],14],15]]
    assert_equal  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,14,15], flatten(arr)
  end

  def test_regular_array
    assert_equal  [1,2,3], flatten([1,2,3])
  end

  def test_empty_array
    assert_equal  [], flatten([])
  end

  def test_empty_array2
    assert_equal  [], flatten([[],[[]]])
  end

  def test_empty_3
    arr = [1,[],[2,3,[4,5,[]]]]
    assert_equal  [1,2,3,4,5], flatten(arr)
  end
end
