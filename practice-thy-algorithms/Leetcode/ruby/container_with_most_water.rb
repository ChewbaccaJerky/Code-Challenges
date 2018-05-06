# Leetcode Problem #11

# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). 
# n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). 
# Find two lines, which together with x-axis forms a container, such that the container contains the most water.
# Note: You may not slant the container and n is at least 2.

def container_with_most_water(height)
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