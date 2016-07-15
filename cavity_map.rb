# You are given a square map of size . Each cell of the map has a value denoting its depth. 
# We will call a cell of the map a cavity if and only if this cell is not on the border of the map and each cell adjacent 
# to it has strictly smaller depth. Two cells are adjacent if they have a common side (edge).
# Find all the cavities on the map and depict them with the uppercase character X.
# Solved on hackerrank.com

# For example:
# If the input map is
# 1112
# 1912
# 1892
# 1234

# The output should be:
# 1112
# 1X12
# 18X2
# 1234

# grid is the input, new_grid is the output

def cav(i, j, grid)
    return false if grid[i][j] <= grid[i-1][j] 
    return false if grid[i][j] <= grid[i+1][j]
    return false if grid[i][j] <= grid[i][j-1]
    return false if grid[i][j] <= grid[i][j+1]
    true
end
    
new_grid = []
for grid_i in (0..n-1)
    arr = ''
    n.times do 
        arr = arr + '0'
    end    
    new_grid[grid_i] = arr
end

new_grid[0] = grid[0]
new_grid[n-1] = grid[n-1]
(1..n-2).each do |q|
    new_grid[q][0] = grid[q][0]
    new_grid[q][n-1] = grid[q][n-1]
end    


(1..n-2).each do |i|
    (1..n-2).each do |j| 
         if cav(i,j,grid)
             new_grid[i][j] = 'X'
         else  
             new_grid[i][j] = grid[i][j]
         end
    end
end
