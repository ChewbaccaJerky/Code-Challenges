class Node
  attr_accessor :val
  attr_accessor :left
  attr_accessor :right
  
  def initialize(val, left, right)
    @val = val
    @left = left
    @right = right
  end
end

def build_tree(depth)
  return nil if depth < 1
  root = Node.new(1, nil, nil)
  return root if depth == 1
  build_tree_helper(depth - 1, [root])
  root
end

def build_tree_helper(depth, nodes)
  return if depth == 0
  
  new_level_nodes = []
  nodes.each do |node|
    new_val = depth == 1 ? 1 : 1
    new_node_left = Node.new(new_val, nil, nil)
    new_node_right = Node.new(new_val, nil, nil)
    node.left = new_node_left
    node.right = new_node_right
    
    new_level_nodes.push(new_node_left)
    new_level_nodes.push(new_node_right)
  end
  
  build_tree_helper(depth - 1, new_level_nodes)
end

def is_uni_val?(node)
  # base case 
  return true if node.left.nil? && node.right.nil?
  
  # if left node or right node does not equal to parent node
  return false if (node.val != node.left.val) || 
                  (node.val != node.right.val)
  
  # call is_uni_val? on left node
  left = is_uni_val?(node.left)
  # call is uni val? on right node
  right = is_uni_val?(node.right)
  
  left && right
end


def print_tree(root)
  return unless root
  print "#{root.val} "
  print_tree(root.left)
  print_tree(root.right)
end


root = build_tree(3)
print_tree(root)
puts is_uni_val?(root)

     #     3
     #    / \
     #   3   3
     #  / \ / \
     # 3  4 3  3 

# left = true
# right = false

# left && right -> false