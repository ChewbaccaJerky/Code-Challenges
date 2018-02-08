def max_area(height)
    max_area = 0
    left = 0
    right = height.length - 1
    
    until right - left == 0 do 
        length = height[left] < height[right] ? height[left] : height[right]
        width = right - left
        area = length * width
        max_area = area if max_area < area
        
        if height[left] <= height[right]
            left += 1
        else
            right -= 1
        end
    end
    
    max_area
end