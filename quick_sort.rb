# Implementing 'quick sort' method for an array integeres

def quick_sort(arr)
    return arr if arr.length <= 1
    last_ind = arr.length - 1
    pivot = arr[last_ind]
    
    wall = 0
    (0..last_ind-1).each do |i|
        if arr[i] < pivot
           if wall > 0 && wall < last_ind - 1 
             tmp = arr[i]
             arr[i] = arr[wall]
             arr[wall] = tmp
           end
           wall += 1
        end
    end
    
    # positioning the pivot
    arr[last_ind] = arr[wall]
    arr[wall] = pivot
    arr[0..wall-1] = quick_sort(arr[0..wall-1]) if wall > 0
    arr[wall+1..last_ind] = quick_sort(arr[wall+1..last_ind]) if wall < last_ind
    arr
end
