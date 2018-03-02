

# CHAPTER 4 TREES AND GRAPHS

# 4.2 MINIMAL TREE
# Given a sorted(increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.

def minimalTree(arr, min_height)
    return false if arr.length < min_height
    bst = BST.new

    arr.each do |num|
        bst.insert(num)
    end
    
    bst
end

# 4.3 LIST OF DEPTHS
# Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth
#(e.g. if you have a tree with Depth D, you will have D)

def list_of_depths(node, level = 0, arrlist = {})
    
    # processing
    add_to_list(node, level, arrlist)
    arrlist = list_of_depths(node.left, level + 1, arrlist)
    arrlist = list_of_depths(node.right, level + 1, arrlist)
    arrlist
end

def add_to_list(node, level, arrlist)

    # Check linked list exist in current level
    if arrlist[level]
        # access linkedlist then insert node
        arrlist[level].insert(node)
    # does not exist
    else
        # create linked list and insert node
        arrlist[level] = LinkedList.new([node])
    end

    arrList
end

