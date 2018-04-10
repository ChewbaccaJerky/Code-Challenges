=begin
    4.11 Random Node:
    You are implementing a binary tree class from scratchg which, 
    in addition to insert, find, and delete, has a method getRandomNode(),
    which returns a random node from the tree. All nodes should be equally likely to be
    chosen. Design and implement an algorithm for getRandomNode, 
    and explain how you would implement the rest of the methods
=end

class Node
    attr_accessor :val, :left_count, :right_count, :left, :right, :parent
    
    def initialize(val)
        @val = val
        @left_count = 0
        @right_count = 0
        @parent = nil
        @left = nil
        @right = nil
    end

    def to_str
        "val: #{@val} left_count: #{@left_count} right_count: #{@right_count} left: #{@left} right: #{@right} parent: #{@parent}"
    end

    def replace(node)
        @val = node.val
    end

    def decrement(branch)
        if branch == "left"
            @left_count -= 1
        elsif branch == "right"
            @right_count -= 1
        end
    end
    
    def detach
        @parent = nil
        @left = nil
        @right = nil
    end

    def [](branch)
        if branch == "left"
            @left
        elsif branch == "right"
            @right
        end
    end

    def []=(branch, node)
        if branch == "left"
            @left = node
        elsif branch == "right"
            @right = node
        end
    end
end

class BinarySearchTree
    attr_accessor :root
    # initialize
    def initialize
        @root = nil
    end

    # insert
    def insert(val, node = @root, new_node = nil)
        if new_node.nil?
            new_node = Node.new(val)
        end

        # case 0: Empty tree
        if @root.nil?
            @root = new_node
            return
        end

        # case 1: Nodes in tree
        # go left
        if val <= node.val
            if node.left.nil?
                new_node.parent = node
                node.left = new_node
            else
                insert(val, node.left, new_node)
            end
            node.left_count += 1
        else
            # go right
            if node.right.nil?
                new_node.parent = node
                node.right = new_node
            else
                insert(val, node.right, new_node)
            end
            node.right_count += 1
        end
    end

    # find
    def find(val, node = @root)
        return nil if node.nil?
        
        return node if node.val == val
        
        if val <= node.val
            find(val, node.left)
        else
            find(val, node.right)
        end
    end

    # delete
    def delete(val, decrement = true)
        node = find(val)

        return nil if node.nil?

        
        # decrement predecessors [left|right]_count by 1
        if decrement
            temp_node = node
            until temp_node.parent.nil?
                parent = temp_node.parent
                if parent.right == temp_node
                    parent.right_count -= 1
                else
                    parent.left_count -= 1
                end
                temp_node = temp_node.parent
            end
        end

        # remove node and handle cases
        num_child = 0
        num_child += 1 if node.left
        num_child += 1 if node.right
        # case 0: 0 children
        if num_child == 0
            remove_0_children(node)
        # case 1: 1 child
        elsif num_child == 1
            remove_1_child(node)
        # case 2: 2 children
        else
            remove_2_children(node)
        end
    end

    # getRandomNode
    def getRandomNode
    end

    def print_tree(node = @root)
        return if node.nil?

        puts node.to_str
        print_tree(node.left)
        print_tree(node.right)
    end

    private

    def remove_0_children(node)
        if @root == node
            @root.detach
            return
        end

        if node.parent.right == node
            node.parent.right = nil
        else
            node.parent.left = nil
        end
        node.detach
    end

    def remove_1_child(node)
        # case 1 root == node
        if @root == node
            if node.left
                @root = node.left
            else
                @root = node.right
            end
            node.detach
            return
        end

        # case 2 node is not root
        parent = node.parent
        parent_branch = parent.left == node ? "left" : "right"
        node_branch = node.left == node ? "left" : "right"

        parent[parent_branch] = node[node_branch]
        node.detach
    end

    def remove_2_children(node)
        
        right_smallest = node.right

        until right_smallest.left.nil?
            right_smallest = right_smallest.left
        end

        temp = right_smallest
        until right_smallest == node
            parent = temp.parent
            parent_branch = parent.left == temp ? "left" : "right"


    end
end

values = [7, 5, 12, 11, 10, 9, 4, 6, 13]

bs = BinarySearchTree.new

values.each do |val|
    bs.insert(val)
end

bs.print_tree
puts "-------------------------"
bs.delete(12)
bs.print_tree
