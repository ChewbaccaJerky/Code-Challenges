

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

# 4.4 CHECK BALANCED
# Implement a funciton to check if a binary tree is balanced. 
# For the purposes of this question, 
# balanced tree is defined to be a tree such that the heights 
# of the two subtress of any node never differ by more than one.

INT_MIN_VALUE = -2147483648

def check_balanced( node )
    return check_height(node) != INT_MIN_VALUE
end

def check_height( node )
    return -1 if node.nil?
    
    leftHeight = getHeight(node.left)
    return INT_MIN_VALUE if leftHeight == INT_MIN_VALUE # pass up

    rightHeight = getHeight(node.right)
    return INT_MIN_VALUE if rightHeight == INT_MIN_VALUE # pass up

    heightDiff = leftHeight - rightHeight
    if height.abs > 1
        INT_MIN_VALUE # found error. pass up
    else
        [leftHeight, rightHeight].max + 1
    end
end

def getHeight( node )
    # base case
    return -1 if node.nil?
    [getHeight(node.left), getHeight(node.right)].max + 1
end


# 4.5 Validating BST
# Implement a function to check if a binary tree is a binary tree is a binary search tree.

def check_BST(node, range = [-2147483647, 2147483647])
    MIN = 0
    MAX = 1
    return true if node.nil?
    return false unless range[MIN] <= node.val || node.val < range[1]
    return false unless 
        check_BST(node.left, [range[MIN], node.val]) ||
        check_BST(node.right, [node.val, range[MAX]])

    true
end