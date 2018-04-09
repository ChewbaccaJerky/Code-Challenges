

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

# 4.6 Successor
# Write an algorithm to the 'next' node(i.e in-order succession) of a given node in a binary search tree.
# You may assume that each node has a link to its parent

def successor(node)
    # case 0: Does not have a right node
    if node.right.nil?
        # move up the parent nodes until parent is greater than node
        cur_node = node
        until node.parent.val > cur_node.val
            node = node.parent
        end
        return node.parent
    else
    # case 1: Has a right node
        # move to right node
        node = right.node
        # move to left node until left node is empty
        until node.left.nil?
            node = left.node
        end
        node
    end
end

# 4.8 FIRST COMMON ANCESTOR
# Design an algorithm and write code to find the first common ancestor
# of two nodes in a binary tree. Avoid storing additional nodes in a data structure.
# NOTE: This is not necessarily a binary search tree.
# @params: Node node1, Node node2
# @return: Node

def common_ancestor(node1, node2)

    until node1.parent.nil? && node2.parent.nil?
        node1.visited = true unless node1.parent.nil?
        node2.visited= true unless node2.parent.nil?

        node1 = node1.parent
        node2 = node2.parent

        return node1 if node1.visited?
        return node2 if node2.visited?
    end

    # return root node
    node1
end

# 4.10 Check Subtree
# T1 and T2 are two very large binary trees, with T1 much bigger than T2. 
# Create an algorithm to determine if T2 is a subtree of T1.
# A tree T2 is  subtree of T1 if there exists a node n in T1 such taht the subtree of n is identical to T2.
# That is, if you cut off the tree at node n, the two trees would be identical

def check_subtrees(node_T1, node_T2)
    # Step 1 Find identical root
    root = find_root(node_T1, node_T2)
    return false if root.nil?
    
    # Step 2 Check of the rest of the tree is identical
    identical?(root, node_T2)
end

def find_root(node_T1, node_T2)
    return nil if node_T1.nil?
    return node_T1 if node_T1 == node_T2

    left = find_root(node_T1.left, node_T2)
    right = find_root(node_T1.right, node_T2)

    return left if left
    return right if right
end

def identical?(node_T1, node_T2)
    return true if node_T1.nil?
    return false if node_T1 != node_T2
    
    left = identical?(node_T1.left, node_T2.left)
    right = identical?(node_T1.right, node_T2.right)

    left && right
end

