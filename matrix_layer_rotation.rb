# You are given a 2D matrix, a, of dimension MxN and a positive integer R. 
# You have to rotate the matrix R times. 
# Rotation should be in anti-clockwise direction.
# Solved on hackerrank.com

# An illustration of what happens when the matrix is rotated once:
# 1  2  3  4      2  3  4  8
# 5  6  7  8      1  7 11 12
# 9 10 11 12  ->  5  6 10 16
# 13 14 15 16     9 13 14 15


def one_layer_rotation(grid, first_row, first_col, last_row, last_col)
    # top row
    top_left = grid[first_row][first_col]
    (first_col+1..last_col).each do |i|
        grid[first_row][i-1] = grid[first_row][i]
    end
    
    # left col
    bottom_left = grid[last_row][first_col]
    (last_row-1).downto(first_row+1) do |i|
        grid[i+1][first_col] = grid[i][first_col]
    end
    grid[first_row+1][first_col] = top_left
    
    # bottom row
    bottom_right = grid[last_row][last_col]
    (last_col-1).downto(first_col+1) do |i|
        grid[last_row][i+1] = grid[last_row][i]
    end
    grid[last_row][first_col+1] = bottom_left
    
    # right col
    (first_row+1..last_row-1).each do |i|
        grid[i-1][last_col] = grid[i][last_col] 
    end
    grid[last_row-1][last_col] = bottom_right
end

def matrix_rotation(grid, m, n, r)
    first_row = 0
    first_col = 0
    last_row = m - 1
    last_col = n - 1
  
    while (last_row > first_row && last_col > first_col) do
        
        # For performance issues, in case r is huge we won't rotate the matrix r times. We omit repetitions. 
        total_numbers = (last_row - first_row + 1) * 2 + (last_col - first_col - 1) * 2
        rotations_needed = r % total_numbers
        rotations_needed.times do
          one_layer_rotation(grid, first_row, first_col, last_row, last_col)
        end
        first_row += 1
        first_col += 1
        last_row -= 1
        last_col -= 1 
    end
end
 
matrix_rotation(grid, m, n, r)
